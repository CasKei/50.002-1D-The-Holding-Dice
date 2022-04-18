/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_CU_1 (
    input clk,
    input rst,
    input [15:0] regfile_datain,
    input p1_rolldicebutton,
    input p1_holdbutton,
    input p2_rolldicebutton,
    input p2_holdbutton,
    output reg [5:0] alufn,
    output reg [1:0] asel,
    output reg [2:0] bsel,
    output reg [1:0] alu_out_sel,
    output reg [3:0] regfile_write_address,
    output reg [3:0] regfile_read_address_a,
    output reg [3:0] regfile_read_address_b,
    output reg we_regfile,
    output reg decimal_counter_increase,
    output reg decimal_counter_rst,
    output reg score_rst,
    output reg [3:0] debug,
    output reg [2:0] diceout
  );
  
  
  
  localparam DEBUG_game_fsm = 5'd0;
  localparam IDLE_game_fsm = 5'd1;
  localparam P1_TURN_game_fsm = 5'd2;
  localparam P1_CHANGE_DICE_SCORE_game_fsm = 5'd3;
  localparam P1_BRANCH_DICEROLL_game_fsm = 5'd4;
  localparam BRANCH_P1BUTTON_game_fsm = 5'd5;
  localparam INCREASE_P1ACCSCORE_game_fsm = 5'd6;
  localparam RESET_CURRENT_P1SCORE_game_fsm = 5'd7;
  localparam INCREASE_P1_CURRENTSCORE_game_fsm = 5'd8;
  localparam SUM_P1POSSIBLESCORE_game_fsm = 5'd9;
  localparam CHECKP150_game_fsm = 5'd10;
  localparam BRANCH_P1CONDITION_game_fsm = 5'd11;
  localparam P2_TURN_game_fsm = 5'd12;
  localparam P2_CHANGE_DICE_SCORE_game_fsm = 5'd13;
  localparam P2_BRANCH_DICEROLL_game_fsm = 5'd14;
  localparam BRANCH_P2BUTTON_game_fsm = 5'd15;
  localparam INCREASE_P2ACCSCORE_game_fsm = 5'd16;
  localparam RESET_CURRENT_P2SCORE_game_fsm = 5'd17;
  localparam INCREASE_P2_CURRENTSCORE_game_fsm = 5'd18;
  localparam SUM_P2POSSIBLESCORE_game_fsm = 5'd19;
  localparam CHECKP250_game_fsm = 5'd20;
  localparam BRANCH_P2CONDITION_game_fsm = 5'd21;
  localparam RESET_COUNTER_game_fsm = 5'd22;
  localparam CHECK_WINNER_game_fsm = 5'd23;
  localparam BRANCH_WINNER_game_fsm = 5'd24;
  localparam P1WINS_game_fsm = 5'd25;
  localparam P2LOSE_game_fsm = 5'd26;
  localparam P2WINS_game_fsm = 5'd27;
  localparam P1LOSE_game_fsm = 5'd28;
  localparam GAMEOVER_game_fsm = 5'd29;
  
  reg [4:0] M_game_fsm_d, M_game_fsm_q = DEBUG_game_fsm;
  wire [3-1:0] M_dicedice_out;
  reg [1-1:0] M_dicedice_rollbtn;
  dice_4 dicedice (
    .clk(clk),
    .rst(rst),
    .rollbtn(M_dicedice_rollbtn),
    .out(M_dicedice_out)
  );
  
  reg [2:0] M_testdice_d, M_testdice_q = 1'h0;
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    M_testdice_d = M_testdice_q;
    
    alufn = 1'h0;
    asel = 1'h0;
    bsel = 1'h0;
    we_regfile = 1'h0;
    regfile_write_address = 11'h457;
    regfile_read_address_a = 1'h0;
    regfile_read_address_b = 1'h0;
    alu_out_sel = 1'h0;
    debug = 4'h0;
    decimal_counter_increase = 1'h0;
    decimal_counter_rst = 1'h0;
    score_rst = 1'h0;
    M_dicedice_rollbtn = 1'h0;
    diceout = 1'h0;
    M_game_fsm_d = DEBUG_game_fsm;
    if (rst) begin
      M_game_fsm_d = DEBUG_game_fsm;
      score_rst = 1'h1;
    end
    
    case (M_game_fsm_q)
      DEBUG_game_fsm: begin
        if (p1_rolldicebutton) begin
          M_dicedice_rollbtn = p1_rolldicebutton;
          M_testdice_d = M_dicedice_out;
          diceout = M_testdice_q;
          alufn = 6'h00;
          asel = 2'h0;
          we_regfile = 1'h1;
          alu_out_sel = 2'h0;
          regfile_read_address_a = 4'h8;
          regfile_write_address = 4'h8;
          if (M_dicedice_out == 1'h1) begin
            bsel = 3'h2;
          end else begin
            if (M_dicedice_out == 2'h2) begin
              bsel = 3'h3;
            end else begin
              if (M_dicedice_out == 2'h3) begin
                bsel = 3'h4;
              end else begin
                if (M_dicedice_out == 3'h4) begin
                  bsel = 3'h5;
                end else begin
                  if (M_dicedice_out == 3'h5) begin
                    bsel = 3'h6;
                  end else begin
                    if (M_dicedice_out == 3'h6) begin
                      bsel = 3'h7;
                    end
                  end
                end
              end
            end
          end
          M_game_fsm_d = DEBUG_game_fsm;
        end
        if (p1_holdbutton) begin
          M_game_fsm_d = IDLE_game_fsm;
        end
        M_game_fsm_d = DEBUG_game_fsm;
      end
      IDLE_game_fsm: begin
        if (p1_rolldicebutton) begin
          M_game_fsm_d = DEBUG_game_fsm;
        end
        M_game_fsm_d = IDLE_game_fsm;
      end
      P1_TURN_game_fsm: begin
        alufn = 6'h00;
        regfile_read_address_a = 4'h7;
        bsel = 3'h1;
        asel = 2'h0;
        we_regfile = 1'h1;
        regfile_write_address = 4'h7;
        if (p1_rolldicebutton) begin
          M_game_fsm_d = P1_CHANGE_DICE_SCORE_game_fsm;
        end else begin
          if (p1_holdbutton) begin
            M_game_fsm_d = INCREASE_P1ACCSCORE_game_fsm;
          end
        end
      end
      P1_CHANGE_DICE_SCORE_game_fsm: begin
        if (M_dicedice_out == 1'h0) begin
          M_game_fsm_d = RESET_CURRENT_P1SCORE_game_fsm;
        end else begin
          M_game_fsm_d = P1_BRANCH_DICEROLL_game_fsm;
        end
      end
      P1_BRANCH_DICEROLL_game_fsm: begin
        if (M_dicedice_out == 1'h1) begin
          alufn = 6'h00;
          asel = 2'h0;
          bsel = 3'h2;
          we_regfile = 1'h1;
          regfile_read_address_a = 4'h2;
          regfile_write_address = 4'h2;
          alu_out_sel = 2'h0;
          M_game_fsm_d = SUM_P1POSSIBLESCORE_game_fsm;
        end else begin
          if (M_dicedice_out == 2'h2) begin
            alufn = 6'h00;
            asel = 2'h0;
            bsel = 3'h3;
            we_regfile = 1'h1;
            regfile_read_address_a = 4'h2;
            regfile_write_address = 4'h2;
            alu_out_sel = 2'h0;
            M_game_fsm_d = SUM_P1POSSIBLESCORE_game_fsm;
          end else begin
            if (M_dicedice_out == 2'h3) begin
              alufn = 6'h00;
              asel = 2'h0;
              bsel = 3'h4;
              we_regfile = 1'h1;
              regfile_read_address_a = 4'h2;
              regfile_write_address = 4'h2;
              alu_out_sel = 2'h0;
              M_game_fsm_d = SUM_P1POSSIBLESCORE_game_fsm;
            end else begin
              if (M_dicedice_out == 3'h4) begin
                alufn = 6'h00;
                asel = 2'h0;
                bsel = 3'h5;
                we_regfile = 1'h1;
                regfile_read_address_a = 4'h2;
                regfile_write_address = 4'h2;
                alu_out_sel = 2'h0;
                M_game_fsm_d = SUM_P1POSSIBLESCORE_game_fsm;
              end else begin
                if (M_dicedice_out == 3'h5) begin
                  alufn = 6'h00;
                  asel = 2'h0;
                  bsel = 3'h6;
                  we_regfile = 1'h1;
                  regfile_read_address_a = 4'h2;
                  regfile_write_address = 4'h2;
                  alu_out_sel = 2'h0;
                  M_game_fsm_d = SUM_P1POSSIBLESCORE_game_fsm;
                end
              end
            end
          end
        end
      end
      SUM_P1POSSIBLESCORE_game_fsm: begin
        alufn = 6'h00;
        regfile_read_address_a = 4'h0;
        regfile_read_address_b = 4'h2;
        bsel = 3'h0;
        asel = 2'h0;
        we_regfile = 1'h1;
        regfile_write_address = 4'hf;
        M_game_fsm_d = CHECKP150_game_fsm;
      end
      CHECKP150_game_fsm: begin
        alufn = 6'h37;
        regfile_read_address_b = 4'hf;
        bsel = 3'h0;
        asel = 2'h3;
        we_regfile = 1'h1;
        regfile_write_address = 4'hf;
        M_game_fsm_d = BRANCH_P1CONDITION_game_fsm;
      end
      BRANCH_P1CONDITION_game_fsm: begin
        regfile_read_address_b = 4'hf;
        we_regfile = 1'h0;
        if (regfile_datain[0+0-:1]) begin
          M_game_fsm_d = CHECK_WINNER_game_fsm;
        end else begin
          M_game_fsm_d = P1_TURN_game_fsm;
        end
      end
      INCREASE_P1ACCSCORE_game_fsm: begin
        alufn = 6'h00;
        asel = 2'h0;
        bsel = 3'h0;
        we_regfile = 1'h1;
        regfile_read_address_a = 4'h0;
        regfile_read_address_b = 4'h2;
        regfile_write_address = 4'h0;
        M_game_fsm_d = RESET_CURRENT_P1SCORE_game_fsm;
      end
      RESET_CURRENT_P1SCORE_game_fsm: begin
        alufn = 6'h08;
        asel = 2'h0;
        bsel = 3'h1;
        regfile_read_address_a = 4'h2;
        we_regfile = 1'h1;
        regfile_write_address = 4'h2;
        M_game_fsm_d = P2_TURN_game_fsm;
      end
      P2_TURN_game_fsm: begin
        alufn = 6'h00;
        asel = 2'h0;
        bsel = 3'h2;
        we_regfile = 1'h1;
        regfile_read_address_a = 4'h7;
        regfile_write_address = 4'h7;
        if (p2_rolldicebutton) begin
          M_game_fsm_d = P2_CHANGE_DICE_SCORE_game_fsm;
        end else begin
          if (p2_holdbutton) begin
            M_game_fsm_d = INCREASE_P2ACCSCORE_game_fsm;
          end
        end
      end
      P2_CHANGE_DICE_SCORE_game_fsm: begin
        if (M_dicedice_out == 1'h0) begin
          M_game_fsm_d = RESET_CURRENT_P2SCORE_game_fsm;
        end else begin
          M_game_fsm_d = P2_BRANCH_DICEROLL_game_fsm;
        end
      end
      P2_BRANCH_DICEROLL_game_fsm: begin
        if (M_dicedice_out == 1'h1) begin
          alufn = 6'h00;
          asel = 2'h0;
          bsel = 3'h2;
          we_regfile = 1'h1;
          regfile_read_address_a = 4'h3;
          regfile_write_address = 4'h3;
          alu_out_sel = 2'h0;
          M_game_fsm_d = SUM_P2POSSIBLESCORE_game_fsm;
        end else begin
          if (M_dicedice_out == 2'h2) begin
            alufn = 6'h00;
            asel = 2'h0;
            bsel = 3'h3;
            we_regfile = 1'h1;
            regfile_read_address_a = 4'h3;
            regfile_write_address = 4'h3;
            alu_out_sel = 2'h0;
            M_game_fsm_d = SUM_P2POSSIBLESCORE_game_fsm;
          end else begin
            if (M_dicedice_out == 2'h3) begin
              alufn = 6'h00;
              asel = 2'h0;
              bsel = 3'h4;
              we_regfile = 1'h1;
              regfile_read_address_a = 4'h3;
              regfile_write_address = 4'h3;
              alu_out_sel = 2'h0;
              M_game_fsm_d = SUM_P2POSSIBLESCORE_game_fsm;
            end else begin
              if (M_dicedice_out == 3'h4) begin
                alufn = 6'h00;
                asel = 2'h0;
                bsel = 3'h5;
                we_regfile = 1'h1;
                regfile_read_address_a = 4'h3;
                regfile_write_address = 4'h3;
                alu_out_sel = 2'h0;
                M_game_fsm_d = SUM_P2POSSIBLESCORE_game_fsm;
              end else begin
                if (M_dicedice_out == 3'h5) begin
                  alufn = 6'h00;
                  asel = 2'h0;
                  bsel = 3'h6;
                  we_regfile = 1'h1;
                  regfile_read_address_a = 4'h3;
                  regfile_write_address = 4'h3;
                  alu_out_sel = 2'h0;
                  M_game_fsm_d = SUM_P2POSSIBLESCORE_game_fsm;
                end
              end
            end
          end
        end
      end
      SUM_P2POSSIBLESCORE_game_fsm: begin
        alufn = 6'h00;
        asel = 2'h0;
        bsel = 2'h0;
        we_regfile = 2'h1;
        regfile_read_address_a = 4'h1;
        regfile_read_address_b = 4'h3;
        regfile_write_address = 4'hf;
        M_game_fsm_d = CHECKP250_game_fsm;
      end
      CHECKP250_game_fsm: begin
        alufn = 6'h37;
        regfile_read_address_b = 4'hf;
        bsel = 3'h0;
        asel = 2'h3;
        we_regfile = 1'h1;
        regfile_write_address = 4'hf;
        M_game_fsm_d = BRANCH_P2CONDITION_game_fsm;
      end
      BRANCH_P2CONDITION_game_fsm: begin
        we_regfile = 1'h0;
        regfile_read_address_b = 4'hf;
        if (regfile_datain[0+0-:1]) begin
          M_game_fsm_d = CHECK_WINNER_game_fsm;
        end else begin
          M_game_fsm_d = P2_TURN_game_fsm;
        end
      end
      CHECK_WINNER_game_fsm: begin
        alufn = 6'h35;
        regfile_read_address_a = 4'h2;
        regfile_read_address_b = 4'h3;
        asel = 2'h0;
        bsel = 2'h0;
        we_regfile = 1'h1;
        regfile_write_address = 4'hf;
        M_game_fsm_d = BRANCH_WINNER_game_fsm;
      end
      BRANCH_WINNER_game_fsm: begin
        we_regfile = 2'h0;
        regfile_read_address_b = 4'hf;
        if (regfile_datain[0+0-:1]) begin
          M_game_fsm_d = P1WINS_game_fsm;
        end else begin
          M_game_fsm_d = P2WINS_game_fsm;
        end
      end
      P2WINS_game_fsm: begin
        we_regfile = 1'h1;
        regfile_write_address = 4'h1;
        alu_out_sel = 2'h1;
        M_game_fsm_d = P1LOSE_game_fsm;
      end
      P1WINS_game_fsm: begin
        we_regfile = 1'h1;
        regfile_write_address = 4'h0;
        alu_out_sel = 2'h1;
        M_game_fsm_d = P2LOSE_game_fsm;
      end
      P1LOSE_game_fsm: begin
        we_regfile = 1'h1;
        regfile_write_address = 4'h0;
        alu_out_sel = 2'h2;
        M_game_fsm_d = GAMEOVER_game_fsm;
      end
      P2LOSE_game_fsm: begin
        we_regfile = 1'h1;
        regfile_write_address = 4'h1;
        alu_out_sel = 2'h2;
        M_game_fsm_d = GAMEOVER_game_fsm;
      end
      GAMEOVER_game_fsm: begin
        debug = 4'hf;
        M_game_fsm_d = GAMEOVER_game_fsm;
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_game_fsm_q <= M_game_fsm_d;
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_testdice_q <= 1'h0;
    end else begin
      M_testdice_q <= M_testdice_d;
    end
  end
  
endmodule