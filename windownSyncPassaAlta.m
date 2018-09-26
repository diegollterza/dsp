function [kernel] = windownSyncPassaAlta(s, banda_transicao, fc, fs, janela='blackman')
    BW=banda_transicao/fs;
    M=4/BW;
    kernel = windownSyncPassaBaixa(s, banda_transicao, fc, fs, janela)
    kernel = -kernel;
    kernel((M/2)+1)=kernel((M/2)+1)+1;
endfunction