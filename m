From: Andreas Schwab <schwab@redhat.com>
Subject: Re: TIF_NOTIFY_RESUME on m68k?
Date: Thu, 19 Nov 2009 17:34:04 +0100
Message-ID: <m3bpiywk1v.fsf@hase.home>
References: <10f740e80911181202l6cca6b41m827f2c51f639d1f0@mail.gmail.com>
	<19205.28811.911525.832480@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:11727 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752490AbZKSQeU (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 19 Nov 2009 11:34:20 -0500
In-Reply-To: <19205.28811.911525.832480@pilspetsen.it.uu.se> (Mikael
	Pettersson's message of "Thu, 19 Nov 2009 17:21:31 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, linux-kernel@vger.kernel.org

Mikael Pettersson <mikpe@it.uu.se> writes:

> Do current 2.6.3x m68k kernels boot on aranym?

2.6.31 works fine here (from the linux-m68k tree).

Andreas.

-- 
Andreas Schwab, schwab@redhat.com
GPG Key fingerprint = D4E8 DBE3 3813 BB5D FA84  5EC7 45C6 250E 6F00 984E
"And now for something completely different."
