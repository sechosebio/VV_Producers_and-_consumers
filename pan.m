#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM never_0 */
	case 3: // STATE 1 - producers_consumers.pml.nvr:5 - [(((Producer._p==cs)&&(Consumer._p==cs)))] (6:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!(((((int)((P0 *)Pptr(f_pid(0)))->_p)==3)&&(((int)((P1 *)Pptr(f_pid(1)))->_p)==3))))
			continue;
		/* merge: assert(!(((Producer._p==cs)&&(Consumer._p==cs))))(0, 2, 6) */
		reached[2][2] = 1;
		spin_assert( !(((((int)((P0 *)Pptr(f_pid(0)))->_p)==3)&&(((int)((P1 *)Pptr(f_pid(1)))->_p)==3))), " !(((Producer._p==cs)&&(Consumer._p==cs)))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[2][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: // STATE 10 - producers_consumers.pml.nvr:10 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Consumer */
	case 5: // STATE 1 - ./producers_consumers.pml:22 - [((items>0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.items)>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - ./producers_consumers.pml:23 - [printf('Extraído elemento del buffer\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		Printf("Extraído elemento del buffer\n");
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - ./producers_consumers.pml:24 - [items = (items-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)now.items);
		now.items = (((int)now.items)-1);
#ifdef VAR_RANGES
		logval("items", ((int)now.items));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 4 - ./producers_consumers.pml:25 - [printf('%d Elementos en buffer\\n\\n',items)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		Printf("%d Elementos en buffer\n\n", ((int)now.items));
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 8 - ./producers_consumers.pml:27 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Producer */
	case 10: // STATE 1 - ./producers_consumers.pml:11 - [((items<255))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.items)<255)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 2 - ./producers_consumers.pml:12 - [printf('Produce nuevo elemento\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		Printf("Produce nuevo elemento\n");
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 3 - ./producers_consumers.pml:13 - [items = (items+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.items);
		now.items = (((int)now.items)+1);
#ifdef VAR_RANGES
		logval("items", ((int)now.items));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 4 - ./producers_consumers.pml:14 - [printf('%d Elementos en buffer\\n\\n',items)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		Printf("%d Elementos en buffer\n\n", ((int)now.items));
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 8 - ./producers_consumers.pml:17 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

