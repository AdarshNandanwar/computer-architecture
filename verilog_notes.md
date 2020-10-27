# NOTES
## Syntax
1. If the output is *reg*, then use
    ```
        always @ (in1 or in2) begin
            out = in1 + in2;
        end
    ```
    else if output is a *wire*, then use
    ```
        assign out = in1 + in2;
    ```