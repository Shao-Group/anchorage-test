from sys import argv
import os
import subprocess

def RunShellCommand(cmd: str, msg: str = ""):
    if(msg != ""):
        print(msg)
    execute = subprocess.run(cmd.split(), capture_output=True, text=True)
    # print("stdout:", execute.stdout)
    # print("stderr:", execute.stderr)
    if execute.returncode != 0:
        print("stdout:", execute.stdout)
        print("stderr:", execute.stderr)
    return execute.returncode

# Eval Solo 
def eval_sim(method, results_dir, output, ref_dir, quast_dir):
    for ref in os.listdir(ref_dir):
        ref_file = os.path.join(ref_dir, ref)
        if not os.path.isfile(ref_file):
            continue
        ref = ref.replace('.fa', '')

        for cov in [50, 100, 500, 3000, 10000]:
            if method == 'anchorage':
                output_prefix = '_'.join([output, ref, str(cov)])
                cmd = 'quast --min-contig 200  -o results-quast-sim-{}/{} -r {} {}/anchorage_contig_{}.cov_{}.fa'.format(quast_dir, output_prefix, ref_file, results_dir, ref, cov)
                print(cmd)
                RunShellCommand(cmd, "Evaluate results of {}".format(output_prefix))
            elif method in ['spades_alln', 'spades_1iter_500n', 'megahit_1iter_500n', 'megahit_alln' ]:
                output_prefix = '_'.join([output, ref, str(cov)])
                results_subdir = "{}_{}.cov_{}".format(method, ref,cov)
                cmd = 'quast --min-contig 200  -o results-quast-sim-{}/{} -r {} {}/{}/{}_output.fa'.format(quast_dir, output_prefix, ref_file, results_dir, results_subdir, method)
                RunShellCommand(cmd, "Evaluate results of {}".format(output_prefix))
            else:
                print("method", method, "not exists!")
    return 0

if __name__ == "__main__":   
    ref_dir = "data-sim-dupOnce/split_ref"
    method, results_dir, output_prefix, quast_dir = argv[1:]
    eval_sim(method, results_dir, output_prefix, ref_dir, quast_dir)