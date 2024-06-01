import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
from sys import argv
import os
import re
from sys import argv

def plot_4(df1, df2, image_name):
    fig, axes = plt.subplots(2, 2, figsize = (width, height))

    plot_solo(df1, y_name="Genome fraction (%)", code=3, ax=axes[0, 0])
    axes[0, 0].set_ylabel("genome fraction percentage (GFP)", fontsize=15)

    plot_solo(df1, y_name='largest alignment ratio (%)', code=1, ax=axes[0, 1])
    axes[0, 1].set_ylabel("largest alignment ratio (LAR)", fontsize=15)

    plot_solo(df2, y_name="# mismatches per 1000 bp", code=2, ax=axes[1, 0])
    axes[1, 0].set_ylabel("# mismatches per kbp", fontsize=15)

    plot_solo(df2, y_name="# indels per 100 kbp", code=4, ax=axes[1, 1])
    axes[1, 1].set_ylabel("# indels per 100 kbp", fontsize=15)

    for i in range(2):
        for j in range(2):
            # if((i or j) and axes[i, j].get_legend() is not None):
            if(axes[i, j].get_legend() is not None):
                axes[i, j].get_legend().remove()

    axes[1, 1].legend(bbox_to_anchor=(0.375, 1.0), title="depth", loc = 'best', fontsize=13)
    
    plt.tight_layout()
    plt.savefig(str(image_name))
    plt.clf()

def plot_solo(df, y_name, code, ax):
    averages = df.groupby(["method", "cov"])[y_name].mean().reset_index()
    if(code % 2 == 1):
        sns.barplot(x='method', y=y_name, data=df, hue = 'cov', color='red', ax=ax, alpha=0.5, zorder=1, order=order,
            lw = 1, errorbar = ("pi", 50), capsize = 0.5
        , palette=sns.color_palette())
    else:
        sns.barplot(x='method', y=y_name, data=df, hue = 'cov', color='red', ax=ax, alpha=0.5, zorder=1, order=order,
        lw = 1, errorbar = None
        , palette=sns.color_palette())

    if(code == 1):
        ax.set(ylim=(0, 100))
    if(code == 3):
        ax.set(ylim=(0, 100))

    if(code % 2 == 1):
        for i in ax.containers:
            ax.bar_label(i,label_type='center', rotation=90, fmt=lambda x: "{v:.2f}%".format(v=x) if x > 0 else '', fontsize=15)
    else:
        for i in ax.containers:
            ax.bar_label(i,label_type='center', rotation=90, fmt=lambda x: "{v:.2f}".format(v=x) if x > 0 else '', fontsize=15)
    if(code == 4):
        ax.set_ylim(bottom = 0.0)
    ax.set_xlabel("")
    ax.set_xticklabels(ax.get_xticklabels(), size = 15)
    ax.set_yticklabels(ax.get_yticklabels(), size = 13)
    x = ax.get_xlim()
    y = ax.get_ylim()
    ax.set_aspect((x[1]-x[0])/(y[1]-y[0]) * ratio)

def read_dir_to_pd(dir, to_fillna):
    # return df with all reports as columns, rows as assemblies, 'algo': algo name
    dfs = []
    for assemblies in os.listdir(dir):
        assemblies_path = os.path.join(dir, assemblies)
        if not os.path.isdir(assemblies_path):
            continue
        file_path = os.path.join(assemblies_path, 'report.tsv')
        if not os.path.isfile(file_path): 
            df = pd.DataFrame(header=None, names=[assemblies])
            continue

        df = pd.read_csv(file_path, sep='\t', header=None, names=[assemblies]).transpose()
        df['method'] = assembly_to_algo(assemblies)
        if 'Largest alignment' not in df.columns:
            df['Largest alignment'] = 0
            df['Total length'] = 1
        df['cov']    = int(str(assemblies).rsplit('_', 1)[-1])
        dfs.append(df)
    all_df = pd.concat(dfs, axis=0)
    # make numeric
    for numeric_cols in [x for x in all_df.columns if x != '# unaligned contigs' and x != 'Assembly']:
        if to_fillna:
            all_df[numeric_cols] = pd.to_numeric(all_df[numeric_cols], errors='ignore').fillna(0)
        else:
            all_df[numeric_cols] = pd.to_numeric(all_df[numeric_cols], errors='ignore')
    all_df['largest alignment ratio (%)'] = all_df['Largest alignment'] / all_df ['Total length'] * 100
    all_df['# mismatches per 1000 bp'] = all_df['# mismatches per 100 kbp'] / 100

    return all_df

def assembly_to_algo(assemblies):
    algo = 'not_known'
    if assemblies.startswith('anchorage_'):
        algo = 'Anchorage'
    elif assemblies.startswith('spades_1iter_500n'):
        algo = 'SPAdes500'
    elif assemblies.startswith('spades_alln_') or (assemblies.startswith('spades_') and '500' not in assemblies):
        algo = 'SPAdes'
    elif assemblies.startswith('megahit_alln_'):
        algo = 'MEGAHIT'
    elif assemblies.startswith('megahit_1iter_500n'):
        algo = 'MEGAHIT500'
    return algo

def alphanumeric_no_space(oristr):
    pattern = "[^0-9a-zA-Z]+"
    return re.sub(" +", "", re.sub(pattern, "", oristr))


if __name__ == "__main__":
    quast_dir = argv[1]

    width, height = 16.0, 9.0
    ratio = float(height)/width
    order = ['Anchorage', 'SPAdes', 'SPAdes500', 'MEGAHIT', 'MEGAHIT500']

    if not os.path.isdir('plot'):
        os.mkdir('plot')
    solo_df_fillna = read_dir_to_pd(quast_dir, to_fillna=True)
    solo_df_keepna = read_dir_to_pd(quast_dir, to_fillna=False)
    plot_4(solo_df_fillna, solo_df_keepna, "plot/sim-dupOnce.pdf")
