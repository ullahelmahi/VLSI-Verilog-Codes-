module mealy11(Clock, Reset, w, z,y,Y);
	input Clock, Reset, w;
	output reg z;
	output reg  y,Y;
	parameter  A = 0, B = 1;


always @(posedge Clock, posedge Reset)
begin
	if (Reset == 1) 
		begin
		y = 0;
		Y=0;
		z=0;
		end		
	else 
		begin
			y=Y;
			case(y) 
			A: 	if (w)
				begin 
			      Y= B;
			      z=0; 
			      end
				else 
				begin
				  Y= A;
				  z=0;
				 end
			B: 	if (w)
				begin 
			      Y= B;
			      z=1; 
			      end
				else 
				begin
				  Y= A;
				  z=0;
				 end
			default: Y = 1'bx;
			endcase
		end
end

endmodule

