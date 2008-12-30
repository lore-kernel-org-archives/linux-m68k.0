From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] m68k: wire up sys_restart_syscall
Date: Tue, 30 Dec 2008 14:09:48 +0100
Message-ID: <jeabadkdwj.fsf@sykes.suse.de>
References: <jezliekey6.fsf@sykes.suse.de>
	<Pine.LNX.4.64.0812301311241.14380@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.suse.de ([195.135.220.2]:53289 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751515AbYL3NJu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 30 Dec 2008 08:09:50 -0500
In-Reply-To: <Pine.LNX.4.64.0812301311241.14380@anakin> (Geert Uytterhoeven's
	message of "Tue, 30 Dec 2008 13:12:33 +0100 (CET)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Is there an easy way to test this?

Run 'sleep 100' and then attach to it with strace.  Without this patch
the nanosleep syscall returns with an error instead of being restarted.

Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstra=DFe 5, 90409 N=FCrnberg, Germany
PGP key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
