function [kernel] = windownSyncPassaBaixa(s, banda_transicao, fc, fs, janela='blackman')
       
    BW=banda_transicao/fs;  % largura da banda de transição normalizada
    M=4/BW;
    
    fc_normalizada=fc/fs;
    if (janela='blackman')
        for n=0:M-1
           kernel(n+1)=((sin(2*pi*fc_normalizada.*(n-M/2)))/(n-M/2)) .* (0.42-0.5.*cos(2*pi*n./M)+0.08*cos(4*pi*n./M));
        end;  
    elseif (janela='hanning')
        for n=0:M-1
           kernel(n+1)=((sin(2*pi*fc_normalizada.*(n-M/2)))/(n-M/2)) .* (0.54-0.46*cos(2*pi*n./M));
        end;
    endif
    
    kernel((M/2)+1) = 2*pi*fc_normalizada;
    kernel= kernel./ sum(kernel);

endfunction