module moore11(Clock, Reset, w, z,y,Y);
	input Clock, Reset, w;
	output reg z;
	output reg [1:0] y,Y;
	parameter [1:0] A = 0, B = 1, C = 2;


always @(posedge Clock, posedge Reset)
begin
	if (Reset == 1) 
		begin
		y = 0;
		Y=0;
		end		
	else 
		begin
			y=Y;
			case(y) 
			A: 	if (w) Y= B;
				else Y= A;
			B:  if (w) Y = C;
				else Y = A;
			C:  if (w) Y = C;
				else Y = A;
			default: Y = 2'bxx;
			endcase
		end
end


always @(w, y)
	begin
		case (y)
			A:  z =0; 
			B:  z =0;
			C:  z =1;
		endcase
	end
endmodule
