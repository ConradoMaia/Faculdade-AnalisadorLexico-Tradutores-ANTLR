program Teste3;
var a : integer;
var b : real;
begin
    a := 10;
    b := 2.5;
    if a > 5 then
        print("A é maior que 5");
    else
        print("A é menor ou igual a 5");

    a := (b < 3) ? 100 : 200;  // if ternário
    a++;
    while a < 150 do
        print("Valor atual: ${a}");
end.
