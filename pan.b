	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM never_0 */
;
		
	case 3: // STATE 1
		goto R999;

	case 4: // STATE 10
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
		
	case 7: // STATE 3
		;
		now.items = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 9: // STATE 8
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
		
	case 12: // STATE 3
		;
		now.items = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;
	}

