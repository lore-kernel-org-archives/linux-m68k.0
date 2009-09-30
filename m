From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/2] m68k: Cleanup linker scripts using new linker
	script macros.
Date: Wed, 30 Sep 2009 08:53:26 +0200
Message-ID: <20090930065326.GA13850@merkur.ravnborg.org>
References: <1253119466-19488-1-git-send-email-tabbott@ksplice.com> <1253119466-19488-3-git-send-email-tabbott@ksplice.com> <10f740e80909270258o6bde0f3dk720bd5b5c091ed2f@mail.gmail.com> <m2ocowwngg.fsf@igel.home> <alpine.DEB.1.10.0909271351110.14151@dr-wily.mit.edu> <m3zl8dbron.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [195.41.46.235] ([195.41.46.235]:47263 "EHLO pfepa.post.tele.dk"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751654AbZI3Gx2 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 30 Sep 2009 02:53:28 -0400
Content-Disposition: inline
In-Reply-To: <m3zl8dbron.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@redhat.com>
Cc: Tim Abbott <tabbott@ksplice.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 29, 2009 at 07:12:56PM +0200, Andreas Schwab wrote:
> Tim Abbott <tabbott@ksplice.com> writes:
> 
> > Below is a new version of the second patch that attempts to address this 
> > by putting the ALIGN inside a section, so that _end is at the end of the 
> > load segment (I also did a bit more cleanup):
> >
> >   .init_end : {
> > 	/* This ALIGN be in a section so that _end is at the end of the
> > 	   load segment. */
> > 	. = ALIGN(PAGE_SIZE);
> > 	__init_end = .;
> >   }
> >   
> >   _end = .;
> 
> This works fine.

Thanks for testing Andreas.

Geert - I assume you take the corrected version and push to Linus?

	Sam
