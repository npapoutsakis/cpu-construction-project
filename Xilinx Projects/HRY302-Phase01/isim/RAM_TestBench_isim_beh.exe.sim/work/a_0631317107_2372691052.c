/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase01/RAM_TestBench.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0631317107_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 3904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2288U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3080);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2288U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3080);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_0631317107_2372691052_p_1(char *t0)
{
    char t12[16];
    char t13[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    char *t14;
    int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int64 t25;

LAB0:    t1 = (t0 + 3520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(96, ng0);
    t3 = (200 * 1000LL);
    t2 = (t0 + 3328);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 6856);
    t5 = (t0 + 3968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 11U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 4032);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 6867);
    t5 = (t0 + 4096);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 11U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 6878);
    t5 = (t0 + 4160);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(102, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3328);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 6910);
    *((int *)t2) = 0;
    t4 = (t0 + 6914);
    *((int *)t4) = 31;
    t10 = 0;
    t11 = 31;

LAB12:    if (t10 <= t11)
        goto LAB13;

LAB15:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 6972);
    t5 = (t0 + 3968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 11U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 4032);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 6983);
    t5 = (t0 + 4096);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 11U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 6994);
    t5 = (t0 + 4160);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(116, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3328);
    xsi_process_wait(t2, t3);

LAB27:    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(105, ng0);
    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t5 = (t0 + 6640U);
    t7 = (t0 + 6918);
    t9 = (t13 + 0U);
    t14 = (t9 + 0U);
    *((int *)t14) = 0;
    t14 = (t9 + 4U);
    *((int *)t14) = 10;
    t14 = (t9 + 8U);
    *((int *)t14) = 1;
    t15 = (10 - 0);
    t16 = (t15 * 1);
    t16 = (t16 + 1);
    t14 = (t9 + 12U);
    *((unsigned int *)t14) = t16;
    t14 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t12, t6, t5, t7, t13);
    t17 = (t12 + 12U);
    t16 = *((unsigned int *)t17);
    t18 = (1U * t16);
    t19 = (11U != t18);
    if (t19 == 1)
        goto LAB16;

LAB17:    t20 = (t0 + 3968);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t14, 11U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 4032);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 6656U);
    t5 = (t0 + 6929);
    t7 = (t13 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 10;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t15 = (10 - 0);
    t16 = (t15 * 1);
    t16 = (t16 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t16;
    t8 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t12, t4, t2, t5, t13);
    t9 = (t12 + 12U);
    t16 = *((unsigned int *)t9);
    t18 = (1U * t16);
    t19 = (11U != t18);
    if (t19 == 1)
        goto LAB18;

LAB19:    t14 = (t0 + 4096);
    t17 = (t14 + 56U);
    t20 = *((char **)t17);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t8, 11U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 6940);
    t5 = (t0 + 4160);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(109, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3328);
    xsi_process_wait(t2, t3);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB14:    t2 = (t0 + 6910);
    t10 = *((int *)t2);
    t4 = (t0 + 6914);
    t11 = *((int *)t4);
    if (t10 == t11)
        goto LAB15;

LAB24:    t15 = (t10 + 1);
    t10 = t15;
    t5 = (t0 + 6910);
    *((int *)t5) = t10;
    goto LAB12;

LAB16:    xsi_size_not_matching(11U, t18, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(11U, t18, 0);
    goto LAB19;

LAB20:    goto LAB14;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB25:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 7026);
    *((int *)t2) = 0;
    t4 = (t0 + 7030);
    *((int *)t4) = 31;
    t10 = 0;
    t11 = 31;

LAB29:    if (t10 <= t11)
        goto LAB30;

LAB32:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 2288U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t25 = (t3 * 10);
    t2 = (t0 + 3328);
    xsi_process_wait(t2, t25);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB26:    goto LAB25;

LAB28:    goto LAB26;

LAB30:    xsi_set_current_line(119, ng0);
    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t5 = (t0 + 6640U);
    t7 = (t0 + 7034);
    t9 = (t13 + 0U);
    t14 = (t9 + 0U);
    *((int *)t14) = 0;
    t14 = (t9 + 4U);
    *((int *)t14) = 10;
    t14 = (t9 + 8U);
    *((int *)t14) = 1;
    t15 = (10 - 0);
    t16 = (t15 * 1);
    t16 = (t16 + 1);
    t14 = (t9 + 12U);
    *((unsigned int *)t14) = t16;
    t14 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t12, t6, t5, t7, t13);
    t17 = (t12 + 12U);
    t16 = *((unsigned int *)t17);
    t18 = (1U * t16);
    t19 = (11U != t18);
    if (t19 == 1)
        goto LAB33;

LAB34:    t20 = (t0 + 3968);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t14, 11U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4032);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 6656U);
    t5 = (t0 + 7045);
    t7 = (t13 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 10;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t15 = (10 - 0);
    t16 = (t15 * 1);
    t16 = (t16 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t16;
    t8 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t12, t4, t2, t5, t13);
    t9 = (t12 + 12U);
    t16 = *((unsigned int *)t9);
    t18 = (1U * t16);
    t19 = (11U != t18);
    if (t19 == 1)
        goto LAB35;

LAB36:    t14 = (t0 + 4096);
    t17 = (t14 + 56U);
    t20 = *((char **)t17);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t8, 11U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 6672U);
    t5 = (t0 + 7056);
    t7 = (t13 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 31;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t15 = (31 - 0);
    t16 = (t15 * 1);
    t16 = (t16 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t16;
    t8 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t12, t4, t2, t5, t13);
    t9 = (t12 + 12U);
    t16 = *((unsigned int *)t9);
    t18 = (1U * t16);
    t19 = (32U != t18);
    if (t19 == 1)
        goto LAB37;

LAB38:    t14 = (t0 + 4160);
    t17 = (t14 + 56U);
    t20 = *((char **)t17);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t8, 32U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(123, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3328);
    xsi_process_wait(t2, t3);

LAB41:    *((char **)t1) = &&LAB42;
    goto LAB1;

LAB31:    t2 = (t0 + 7026);
    t10 = *((int *)t2);
    t4 = (t0 + 7030);
    t11 = *((int *)t4);
    if (t10 == t11)
        goto LAB32;

LAB43:    t15 = (t10 + 1);
    t10 = t15;
    t5 = (t0 + 7026);
    *((int *)t5) = t10;
    goto LAB29;

LAB33:    xsi_size_not_matching(11U, t18, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(11U, t18, 0);
    goto LAB36;

LAB37:    xsi_size_not_matching(32U, t18, 0);
    goto LAB38;

LAB39:    goto LAB31;

LAB40:    goto LAB39;

LAB42:    goto LAB40;

LAB44:    xsi_set_current_line(129, ng0);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

LAB48:    goto LAB2;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

}


extern void work_a_0631317107_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0631317107_2372691052_p_0,(void *)work_a_0631317107_2372691052_p_1};
	xsi_register_didat("work_a_0631317107_2372691052", "isim/RAM_TestBench_isim_beh.exe.sim/work/a_0631317107_2372691052.didat");
	xsi_register_executes(pe);
}
