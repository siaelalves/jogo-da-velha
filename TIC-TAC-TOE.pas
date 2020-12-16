Program Tic_Tac_Toe ;
 var
  l : char;
  draw : boolean;
  
  X_won_first_column : boolean;
  X_won_second_column : boolean;
  X_won_third_column : boolean;

  X_won_first_line : boolean; 
  X_won_second_line : boolean; 
  X_won_third_line : boolean; 
  
  X_won_right_diagonal : boolean; 
  X_won_left_diagonal : boolean; 
  
  X_column_victory : boolean;
  X_line_victory : boolean;
  X_diagonal_victory : boolean;
  
  X_victory : boolean;
  
  O_won_first_column : boolean;
  O_won_second_column : boolean;
  O_won_third_column : boolean;

  O_won_first_line : boolean; 
  O_won_second_line : boolean; 
  O_won_third_line : boolean; 
  
  O_won_right_diagonal : boolean; 
  O_won_left_diagonal : boolean; 
  O_diagonal_victory : boolean;

  O_column_victory : boolean;
  O_line_victory : boolean;
  
  O_victory : boolean;
  
  X_score : integer;
  O_score : integer;
  D_Score : integer;
   
  move_right : boolean;
  move_left : boolean;
  move_down : boolean;
  move_up : boolean;
  play_again : char;
  game_continue : boolean;
  grid : array[1..3,1..3] of char;
  
  c : char;
  player : char;
  plone : char;
  pltwo : char;
  already_marked : boolean;
  X_moved : boolean;
  O_moved : boolean;
  move_allowed : boolean;
  
  column : integer;
  line : integer;
  x,y : integer;
  m : integer;
  p : integer;

{determines X victories on columns}
Procedure who_won;
	Begin
		if (
			grid[1,1] = 'X') and (
			grid[1,2] = 'X') and (
			grid[1,3] = 'X')
		then
			X_won_first_column := true;
		if (
			grid[2,1] = 'X') and (
			grid[2,2] = 'X') and (
			grid[2,3] = 'X')
		then
			X_won_second_column := true;
		if (
			grid[3,1] = 'X') and (
			grid[3,2] = 'X') and (
			grid[3,3] = 'X')
		then
			X_won_third_column := true;
			
		if (
			grid[1,1] = 'X') and (
			grid[2,1] = 'X') and (
			grid[3,1] = 'X')
		then
			X_won_first_line := true;
	     if (
			grid[1,2] = 'X') and (
			grid[2,2] = 'X') and (
			grid[3,2] = 'X')
		then
			X_won_second_line := true;
		if (
			grid[1,3] = 'X') and (
			grid[2,3] = 'X') and (
			grid[3,3] = 'X')
		then
			X_won_third_line := true;
		
		if (
			grid[1,1] = 'X') and (
			grid[2,2] = 'X') and (
			grid[3,3] = 'X')
		then
			X_won_right_diagonal := true;

	     if (
			grid[3,1] = 'X') and (
			grid[2,2] = 'X') and (
			grid[1,3] = 'X')
		then
			X_won_left_diagonal := true;

		if (
			X_won_first_column = true) or (
			X_won_second_column = true) or (
			X_won_third_column = true)
		then
			X_column_victory := true
		else
			X_column_victory := false;
		
		if (
			X_won_first_line = true) or (
			X_won_second_line = true) or (
			X_won_third_line = true)
		then 
			X_line_victory := true
		else
			X_line_victory := false;
		
		if (
			X_won_left_diagonal = true) or (
			X_won_right_diagonal = true)
		then
			X_diagonal_victory := true
		else
			X_diagonal_victory := false;

		if (
			X_column_victory = true) or (
			X_line_victory = true) or (
			X_diagonal_victory = true)
		then
			begin 
				game_continue := false;
				X_victory := true;
			end
		else
			begin
				game_continue := true;
				X_victory := false;
			end;
		if (
			grid[1,1] = 'O') and (
			grid[1,2] = 'O') and (
			grid[1,3] = 'O')
		then
			O_won_first_column := true;
		if (
			grid[2,1] = 'O') and (
			grid[2,2] = 'O') and (
			grid[2,3] = 'O')
		then
			O_won_second_column := true;
		if (
			grid[3,1] = 'O') and (
			grid[3,2] = 'O') and (
			grid[3,3] = 'O')
		then
			O_won_third_column := true;
			
		if (
			grid[1,1] = 'O') and (
			grid[2,1] = 'O') and (
			grid[3,1] = 'O')
		then
			O_won_first_line := true;
	     if (
			grid[1,2] = 'O') and (
			grid[2,2] = 'O') and (
			grid[3,2] = 'O')
		then
			O_won_second_line := true;
		if (
			grid[1,3] = 'O') and (
			grid[2,3] = 'O') and (
			grid[3,3] = 'O')
		then
			O_won_third_line := true;
		
		if (
			grid[1,1] = 'O') and (
			grid[2,2] = 'O') and (
			grid[3,3] = 'O')
		then
			O_won_right_diagonal := true;

	     if (
			grid[3,1] = 'O') and (
			grid[2,2] = 'O') and (
			grid[1,3] = 'O')
		then
			O_won_left_diagonal := true;

		if (
			O_won_first_column = true) or (
			O_won_second_column = true) or (
			O_won_third_column = true)
		then
			O_column_victory := true
		else
			O_column_victory := false;
		
		if (
			O_won_first_line = true) or (
			O_won_second_line = true) or (
			O_won_third_line = true)
		then 
			O_line_victory := true
		else
			O_line_victory := false;
		
		if (
			O_won_left_diagonal = true) or (
			O_won_right_diagonal = true)
		then
			O_diagonal_victory := true
		else
			O_diagonal_victory := false;

		if (
			O_column_victory = true) or (
			O_line_victory = true) or (
			O_diagonal_victory = true)
		then
			begin 
				game_continue := false;
				O_victory := true;
			end
		else
			begin
				game_continue := true;
				O_victory := false;
			end;
		if (
			grid[1,1] <> ' ') and (
			grid[1,2] <> ' ') and (
			grid[1,3] <> ' ') and (
			grid[2,1] <> ' ') and (
			grid[2,2] <> ' ') and (
			grid[2,3] <> ' ') and (
			grid[3,1] <> ' ') and (
			grid[3,2] <> ' ') and (
			grid[3,3] <> ' ')
		then
			Begin
				game_continue := false;
				draw := true;
			end
		else
			begin
				game_continue := true;
				draw := false;
			end
	end;

{converting units}
Procedure convert;
	Begin
		if column = 6 then x := 1;
		if column = 10 then x := column - 8;
		if column = 14 then x := column - 11;
		if line = 4 then y := 1;
		if line = 6 then y := line - 4;
		if line = 8 then y := line - 5;
	end;

{determines if you can move left}
Procedure can_move_left;
	Begin
		if (
			column = 10) or (
			column = 14)
		then
			move_left := true;
		if (
			column = 6)
		then
			move_left := false;
	End;

{determines if you can move right}
Procedure can_move_right;
	Begin
		if (
			column = 6) or (
			column = 10)
		then
			move_right := true;
		if (
			column = 14)
		then
			move_right := false;
	End;

{determines if you can move down}
Procedure can_move_down;
	Begin
		if (
			line = 4) or (
			line = 6)
		then
			move_down := true;
		if (
			line = 8)
		then
			move_down := false;
	end;

{determines if you can move up}
Procedure can_move_up;
	Begin
		if (
			line = 6) or (
			line = 8)
		then
			move_up := true ;
		if (
			line = 4)
		then
			move_up := false;
	end;

{determines if X has already moved}
Procedure allow_move;
	Begin;
		if
			grid[x,y] = ' '
		then
			move_allowed := true
		else
			move_allowed := false;
	End;

{alternates X and O moves}
Procedure alternate;
	begin
    		if 
			grid[x,y] = 'X' 
		then 
			player := 'O';
    		if 
			grid[x,y] = 'O'
		then 
			player := 'X';    		
	end;

{sets default values for game}
Procedure default;
	Begin
		X_won_first_column :=  false;
		X_won_second_column :=  false;
		X_won_third_column :=  false;

		X_won_first_line :=  false; 
		X_won_second_line :=  false; 
		X_won_third_line :=  false; 
  
		X_won_right_diagonal :=  false; 
		X_won_left_diagonal := false; 
  
		X_column_victory := false;
		X_line_victory := false;
		X_diagonal_victory := false;
  
		X_victory := false;
  
		O_won_first_column := false;
		O_won_second_column := false;
		O_won_third_column := false;

		O_won_first_line := false; 
		O_won_second_line := false; 
		O_won_third_line := false; 
  
		O_won_right_diagonal := false; 
		O_won_left_diagonal := false; 
		O_diagonal_victory := false;

		O_column_victory := false;
		O_line_victory := false;
  
		O_victory := false;
		
		game_continue := true;          
		move_allowed := true;
		column := 6;
		line := 4;
		player := 'X';
		m := 1;
		p := 0;
		l := 'T';
	
		grid[1,1] := ' ';
		grid[1,2] := ' ';
		grid[1,3] := ' ';
		grid[2,1] := ' ';
		grid[2,2] := ' ';
		grid[2,3] := ' ';
		grid[3,1] := ' ';
		grid[3,2] := ' ';
		grid[3,3] := ' ';
	end;

{ends or restarts the game}	
Procedure game_is_over;
	Begin
		textcolor(WHITE);
		gotoxy(20,4);
		if l = 'E' then write('Do you want to play again?');
		if l = 'T' then write('Você deseja jogar de novo?');
		gotoxy(20,6);
		textcolor(LIGHTRED);
		if l = 'E' then write('S');
		if l = 'T' then write('S');
		textcolor(WHITE);
		if l = 'E' then write('im');
		if l = 'T' then write('im');
		if l = 'E' then gotoxy(44,6);
		if l = 'T' then gotoxy(43,6);
		textcolor(LIGHTRED);
		write('N');
		textcolor(WHITE);
		if l = 'E' then write('o');
		if l = 'T' then 
			begin
			gotoxy(44,6);
			write('ao');
			end;
	end;

Procedure refresh;
	Begin  
		gotoxy(2,2);
		textcolor(YELLOW);
		if l = 'E' then write('>> TIC-TAC-TOE <<');
		if l = 'T' then write('> JOGO DA VELHA <');
		gotoxy(6,4);
		textcolor(WHITE);
		write(grid[1,1],' | ',grid[2,1],' | ',grid[3,1]);
		gotoxy(6,5);
		write('-','-','-','-','-','-','-','-','-');
		gotoxy(6,6);
		write(grid[1,2],' | ',grid[2,2],' | ',grid[3,2]);
		gotoxy(6,7);
		write('-','-','-','-','-','-','-','-','-');
		gotoxy(6,8);
		write(grid[1,3],' | ',grid[2,3],' | ',grid[3,3]);
		gotoxy(column,line);
		
		if player = 'X' then 
			begin
				textcolor(LIGHTBLUE);
				write('*');
			end
		else
			begin
				textcolor(YELLOW);
				write('*');
			end;
		
		gotoxy(2,10);
		textcolor(LIGHTGREEN);
		if l = 'E' then write('SCORE:');
		if l = 'T' then write('PONT.:');
		gotoxy(9,10);
		textcolor(WHITE);
		write('X-',X_score);
		gotoxy(14,10);
		write('O-',O_score);
		gotoxy(9,11);
		if l = 'E' then write('Draws  ',D_score);
		if l = 'T' then write('Emps.  ',D_score);
		gotoxy(18,10);
		textcolor(LIGHTGREEN);
		if l = 'E' then write('[SPACEBAR] :');
		if l = 'T' then write('[ ESPAÇO ] :');
		textcolor(WHITE);
		if l = 'E' then write('  Mark');
		if l = 'T' then write('  Marc');
		gotoxy(37,10);
		textcolor(LIGHTGREEN);
		if l = 'E' then write('[Arrows] :');
		if l = 'T' then write('[Setas]  :');
		textcolor(WHITE);
		if l = 'E' then write(' Control');
		if l = 'T' then write(' Controle');
		gotoxy(18,11);
		textcolor(LIGHTGREEN);
		write('[ESC],[Q]  :');
		textcolor(WHITE);
		if l = 'E' then write('  Exit');
		if l = 'T' then write('  Sair');
		gotoxy(30,13);
		textcolor(YELLOW);
		if l = 'E' then write('Developer: ');
		if l = 'T' then write('Desenvolv: ');
		textcolor(WHITE);
		write('Siael Carvalho');
		gotoxy(33,14);
		textcolor(DARKGRAY);
		write('siaelalves@outlook.com');
	end;

Begin
X_score := 0;
O_score := 0;
D_score := 0;
default;
repeat	
	repeat
		gotoxy(20,20);
		clrscr;
		convert;
		refresh;
		allow_move;

          case upcase(readkey) of
						'E' : l := 'E';
						'T' : l := 'T';
						#32 : Begin                  //space
								if move_allowed = true then
								begin 
									grid[x,y] := player;
									alternate;
								end; 
							 end;
						#75 : Begin
								can_move_left;     //left
								if move_left = true then
									column := column - 4;
							 End;
						#77 : Begin
								can_move_right;    //right
								if move_right = true then
									column := column + 4;
							 End;
						#72  : Begin                  //up
								can_move_up;
								if move_up = true then
									line := line - 2;
							 end;
						#80 : Begin                  //down
								 can_move_down;
								 if move_down = true then
								 	line := line + 2;
							 end;
						'Q' : exit;			    //quits game
						#27 : exit;
					end;
		
		who_won;
		
          if 
			X_Victory = true
		then
			begin
				gotoxy(20,8);
				textcolor(WHITE);
				if l = 'E' then write('X won!');
				if l = 'T' then write('X venceu!');
				if X_score = 99 then
					X_score := 99
				else
					X_score := X_score + 1;
			end
		else
			begin
				if 
					O_Victory = true 
				then
					begin
						gotoxy(20,8);
						textcolor(WHITE);
						if l = 'E' then write('O won!');
						if l = 'T' then write('O venceu!');
						if O_score = 99 then
							O_score := 99
						else
							O_score := O_score + 1;
					end
				else
					begin
						if
							draw = true
						then
							begin
								gotoxy(20,8);
								textcolor(WHITE);
								if l = 'E' then write('Draw!');
								if l = 'T' then write('Empate!');
								if D_score = 99 then
									D_score := 99
								else
									D_score := D_score + 1;
								game_is_over;
							end
					end;				
		     end;		     
	until (X_victory = true) or (O_victory = true) or (draw = true);		
	
		begin
			game_is_over;
			if l = 'E' then
			Begin
				repeat
					play_again := upcase(readkey);
				until (play_again = 'Y') or (play_again = #13) or (play_again = 'N');
				if (
					play_again = 'Y') or (
					play_again = #13)
				then
					default;
			end;
			if l = 'T' then
			Begin
				repeat
					play_again := upcase(readkey);
				until (play_again = 'S') or (play_again = #13) or (play_again = 'N');
				if (
					play_again = 'S') or (
					play_again = #13)
				then
					default;
			end;
		end;
	
until play_again = 'N';

End.
