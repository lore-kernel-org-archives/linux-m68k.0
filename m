From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Fwd: [PATCH] [RFC] ataflop: remove buggy IRQ disable from do_fd_request()
Date: Tue, 20 Oct 2009 11:24:44 +0200
Message-ID: <m3k4yqfmeb.fsf@hase.home>
References: <alpine.LSU.2.00.0910091141150.19284@wotan.suse.de>
	<10f740e80910100201n30367714uc57ec3c9c39b92af@mail.gmail.com>
	<alpine.DEB.2.00.0910110846420.20140@zirkon.biophys.uni-duesseldorf.de>
	<alpine.LSU.2.00.0910121106330.19284@wotan.suse.de>
	<alpine.DEB.2.00.0910182126120.6395@zirkon.biophys.uni-duesseldorf.de>
	<alpine.LSU.2.00.0910190932030.8582@wotan.suse.de>
	<alpine.DEB.2.00.0910200847320.8658@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751641AbZJTJ1z@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910200847320.8658@zirkon.biophys.uni-duesseldorf.de>
	(Michael Schmitz's message of "Tue, 20 Oct 2009 08:51:08 +0200
	(CEST)")
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Jiri Kosina <jkosina@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Tejun Heo <tj@kernel.org>, Jens Axboe <jens.axboe@oracle.com>, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Michael Schmitz <schmitz@biophys.uni-duesseldorf.de> writes:

> That. too :-) What I meant to say - the reason why someone chose to comment out 
> the original sti() wasn't really clear. I guess the reason for that particular 
> change has been lost in the pre-git or bk era.

FWIW, this can be traced back to as much as the 2.0 era (1996).  Going
back further is difficult because a lot of files on ftp.uni-erlangen.de
are corrupt.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
