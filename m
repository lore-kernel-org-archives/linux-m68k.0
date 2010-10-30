From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH][resend] m68k,m68knommu: Do not include linux/hardirq.h
	in asm/irqflags.h
Date: Sat, 30 Oct 2010 07:08:08 +0200
Message-ID: <20101030050808.GA26197@frolo.macqel>
References: <4CCAD4E8.8040801@snapgear.com> <AANLkTin4v0=R0Q2etqi+WkLSJTV7T5J01rd+AbymutqG@mail.gmail.com> <4CCB434A.7010400@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay012.isp.belgacom.be ([195.238.6.179]:38505 "EHLO
	mailrelay012.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750955Ab0J3FJC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 30 Oct 2010 01:09:02 -0400
Content-Disposition: inline
In-Reply-To: <4CCB434A.7010400@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, dhowells@redhat.com, gerg@uclinux.org, linux-kernel@vger.kernel.org

Greg, Geert,

On Sat, Oct 30, 2010 at 07:57:30AM +1000, Greg Ungerer wrote:
>
> Hi Geert,
>
> On 30/10/10 02:31, Geert Uytterhoeven wrote:
>> On Fri, Oct 29, 2010 at 16:06, Greg Ungerer<gerg@snapgear.com>  wrot=
e:
>>> Philippe DeMuyter noticed this build failure with Linus' current gi=
t
>>> tree. I think it is m68k clean too. If all are ok with it I'll
>>> pass it directly to Linus.
>>
>> Sorry, I saw his patch before, but had no spare cycles left for test=
ing.
>>
>> Unfortunately that breaks CONFIG_MMU=3Dy:
>>
>> arch/m68k/include/asm/irqflags.h: In function =E2=80=98arch_local_ir=
q_enable=E2=80=99:
>> arch/m68k/include/asm/irqflags.h:43: error: implicit declaration of
>> function =E2=80=98hardirq_count=E2=80=99

Oops.  I am sorry.

>>
>> But if you protect the #include<linux/hardirq.h>  by #ifdef
>> CONFIG_MMU, I'm happy with
>> it.
>
> Thanks, I'll rework it with that.

Thanks to both of you

Philippe
