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
static const char *ng0 = "C:/Users/Nick PC/Documents/VHDL/HRY302-Phase03/Register32Bit.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1315662971_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    int64 t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3152);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB9:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(38, ng0);
    t7 = (10 * 1000LL);
    t3 = xsi_get_transient_memory(32U);
    memset(t3, 0, 32U);
    t8 = t3;
    memset(t8, (unsigned char)2, 32U);
    t9 = (t0 + 3232);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 32U);
    xsi_driver_first_trans_delta(t9, 0U, 32U, t7);
    t14 = (t0 + 3232);
    xsi_driver_intertial_reject(t14, t7, t7);
    goto LAB6;

LAB8:    xsi_set_current_line(40, ng0);
    t7 = (10 * 1000LL);
    t1 = (t0 + 1512U);
    t4 = *((char **)t1);
    t1 = (t0 + 3232);
    t8 = (t1 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_delta(t1, 0U, 32U, t7);
    t12 = (t0 + 3232);
    xsi_driver_intertial_reject(t12, t7, t7);
    goto LAB6;

}


extern void work_a_1315662971_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1315662971_3212880686_p_0};
	xsi_register_didat("work_a_1315662971_3212880686", "isim/proc_sc_testbench_isim_beh.exe.sim/work/a_1315662971_3212880686.didat");
	xsi_register_executes(pe);
}
