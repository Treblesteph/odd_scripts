function output = pretty_plot(x, y, colour)
    if strcmp(colour, 'blu')
        plot(x, y, 'COLOR', [0.2,0.4,1])
        shg
    end
    if strcmp(colour, 'ind')
        plot(x, y, 'COLOR', [0.4,0.2,1])
        shg
    end
    if strcmp(colour, 'pur')
        plot(x, y, 'COLOR', [0.8,0.2,1])
        shg
    end
    if strcmp(colour, 'pin')
        plot(x, y, 'COLOR', [1,0.2,0.8])
        shg
    end
    if strcmp(colour, 'red')
        plot(x, y, 'COLOR', [1,0.2,0.4])
        shg
    end
    if strcmp(colour, 'ora')
        plot(x, y, 'COLOR', [1,0.4,0.2])
        shg
    end
    if strcmp(colour, 'yel')
        plot(x, y, 'COLOR', [1,0.8,0.2])
        shg
    end
    if strcmp(colour, 'tur')
        plot(x, y, 'COLOR', [0.23,0.78,0.75])
        shg
    end
    if strcmp(colour, 'gre')
        plot(x, y, 'COLOR', [0.04,1,0.58])
        shg
    end
end