function [kernel] = windownSyncPassaFaixa(s, banda_transicao, fc_inicial, fc_final, fs, janela='blackman')
    BW=banda_transicao/fs;
    M=4/BW;
        
    kernel_passa_alta = windownSyncPassaBaixa(s, banda_transicao, fc_inicial, fs, janela)
    kernel_passa_alta = -kernel_passa_alta;
    kernel_passa_alta((M/2)+1)=kernel_passa_alta((M/2)+1)+1;
    
    kernel_passa_baixa = windownSyncPassaBaixa(s, banda_transicao, fc_final, fs, janela)
    
    kernel = conv(kernel_passa_baixa, kernel_passa_alta)
    
endfunction