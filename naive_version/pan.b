	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM never_0 */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Consumer */
;
		;
		;
		;
		;
		;
		
	case 9: // STATE 4
		;
		now.items = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Producer */
;
		;
		;
		;
		;
		;
		
	case 14: // STATE 4
		;
		now.items = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;
	}

