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
def eval_solo(method, results_dir, output, quast_dir):
    for index,ref in solo_index_to_ref.items():
        if method == 'anchorage':
            output_prefix = output + '_' + index
            cmd = 'quast --min-contig 200 -o results-quast-{}/{} -r data/control-demult-UMIed-truth/{}.fa {}/anchorage_contig_{}.fa'.format(quast_dir, output_prefix, ref, results_dir, index)
            RunShellCommand(cmd, "Evaluate results of {}".format(output_prefix))
        elif method in ['spades', 'megahit']:
            output_prefix = output + '_' + index
            fasta = get_file_starts_with_end_with(index)
            cmd = 'quast --min-contig 200 -o results-quast-{}/{} -r data/control-demult-UMIed-truth/{}.fa {}/{}'.format(quast_dir, output_prefix, ref, results_dir, fasta)
            RunShellCommand(cmd, "Evaluate results of {}".format(output_prefix))
        else:
            print("method", method, "not exists!")
    return 0

def get_file_starts_with_end_with(prefix,suffix=""):
    for i in res_dir_contents:
        i = str(i)
        s = i.startswith(prefix) or prefix == ''
        t = i.endswith(suffix) or suffix == '' 
        if s and t:
            return i
    return None


if __name__ == "__main__":   
    
    solo_index_to_ref = {
        "AAGCACTG" : "INDAPFOA_02155",
        "CTTAGGAC" : "LJKDLMCB_00058",
        "GAATCCGA" : "ABJBKALP_03263",
        "GCAAGATC" : "LJKDLMCB_00058",
        "GCTATCCT" : "ANBLCFCK_00683",
        "GTGCCATA" : "ANBLCFCK_00683",
        "GTTACGCA" : "ABJBKALP_03263",
        } 
    
    method, results_dir, output_prefix, quast_dir = argv[1:]
    res_dir_contents = os.listdir(results_dir)
    eval_solo(method, results_dir, output_prefix, quast_dir)