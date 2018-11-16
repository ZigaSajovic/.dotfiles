command Ap8 !autopep8 --in-place --indent-size 2 --ignore E121 %
command! -nargs=+ Sub exec printf('%%s/%s/%s/g', [<f-args>][0],[<f-args>][1])|nohl
command! -nargs=+ SubC exec printf('s/%s/%s/g', [<f-args>][0],[<f-args>][1])|nohl
command! -bar -bang Q quit<bang>
