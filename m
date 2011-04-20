From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [uClinux-dev] [PATCH v2 1/6] m68k: merge mmu and non-mmu
	versions of muldi3
Date: Wed, 20 Apr 2011 12:38:02 +0200
Message-ID: <20110420103802.GA26891@frolo.macqel>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com> <1303278880-16153-2-git-send-email-gerg@snapgear.com> <1303278880-16153-3-git-send-email-gerg@snapgear.com> <20110420080609.GA24244@merkur.ravnborg.org> <BANLkTi=9ZNg+eh6S1NeyJaCs4e0tRjJELQ@mail.gmail.com> <20110420091216.GB3296@frolo.macqel> <4DAEA7F5.6080603@snapgear.com> <20110420095529.GC3296@frolo.macqel> <4DAEB2E1.6050404@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay007.isp.belgacom.be ([195.238.6.173]:24550 "EHLO
	mailrelay007.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752095Ab1DTKiJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 20 Apr 2011 06:38:09 -0400
Content-Disposition: inline
In-Reply-To: <4DAEB2E1.6050404@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Greg,

On Wed, Apr 20, 2011 at 08:18:09PM +1000, Greg Ungerer wrote:
>>
>> The 68340 has it also. (And I have an old linux port for this processor)
>
> That is just a SoC that contains a 68020 though, so __mc68020__ would
> be defined for that.

No, this is a cpu32 core, which is a subset of a 68020, so gcc does not
define __mc68020__, or at least should not (there are old bug reports
about that).

>
>
>> I surmise the 68360 has it also.
>
> I believe that is a SoC with a 68040 cpu core, so I would expect that
> __mc68040__ would be correct for that.

This is a cpu32+ core.

Same here.

Not that it is that important now :)

Philippe
