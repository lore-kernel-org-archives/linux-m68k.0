From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: Amiga RTC kernel config [was: Re: m68k 2.6.26-1 vs 2.4.30 comparison]
Date: Fri, 15 May 2009 12:02:13 -0500
Message-ID: <20090515170208.GB1530@luminet.net>
References: <20090503072811.GB3179@luminet.net> <10f740e80905030408p38f87e09ueabc45ef98d4a88f@mail.gmail.com> <20090515023743.GA1647@luminet.net> <m2octulnkv.fsf@igel.home>
Reply-To: lancetag@luminet.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from spamtitan.hbci.com ([206.230.105.6]:51704 "EHLO
	spamtitan.hbci.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753119AbZEORCn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2009 13:02:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by spamtitan.hbci.com (Postfix) with ESMTP id 3ACE6A18720
	for <linux-m68k@vger.kernel.org>; Fri, 15 May 2009 12:02:42 -0500 (CDT)
Received: from mail.hbci.com (ultra.hbci.com [206.230.105.5])
	by spamtitan.hbci.com (Postfix) with ESMTP id 9B5C3A178C2
	for <linux-m68k@vger.kernel.org>; Fri, 15 May 2009 12:02:37 -0500 (CDT)
Received: from tag1amiga.luminet.net (unknown [64.213.220.3])
	by mail.hbci.com (Postfix) with ESMTP id BC0BD2780E2
	for <linux-m68k@vger.kernel.org>; Fri, 15 May 2009 12:02:38 -0500 (CDT)
Received: from lancetag by tag1amiga.luminet.net with local (Exim 3.36 #1 (Debian))
	id 1M50nZ-0000uL-00
	for <linux-m68k@vger.kernel.org>; Fri, 15 May 2009 12:02:17 -0500
Content-Disposition: inline
In-Reply-To: <m2octulnkv.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

On Fri, May 15, 2009 at 11:31:12AM +0200, Andreas Schwab wrote:
> Lance Tagliapietra <lancetag@Luminet.net> writes:
> 
> > Now, there is a /dev/rtc device of type 10 135.  Interestingly, though is that the 
> > kernel is looking for an "rtc0" device based on the kernel config.  So I'll make
> > that change to the kernel config and re-build and see what I get -- or would it 
> > be a better approach to add a /dev/rtc0 c 10 135?
> 
> I think you need a c 254 0 device if you use rtc-generic.
> 
> Andreas.
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
> "And now for something completely different."
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

I beleive I made a mistake here.  I compiled my kernel (and the other 2.6.xx
kernels I have tried) were compiled with CONFIG_RTC_CLASS=y instead of
CONFIG_GEN_RTC=Y and CONFIG_GEN_RTC_X=y which I have now determined are the 
defaults for the m68k arch, and also the options used in my properly working
2.4.30 kernel.

That is why the "/dev/rtc0" showed up in the .config.
I am re-building my kernel to test.

Thanks,

--Lance
