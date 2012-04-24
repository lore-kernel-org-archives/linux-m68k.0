From: Luis Alves <ljalvs@gmail.com>
Subject: Re: __udivsi3: coldfire vs non-coldfire implementation
Date: Tue, 24 Apr 2012 17:29:59 +0100
Message-ID: <CAGj5WxBYTttzLMktsY8MyuJTv3smjLKBFJ+OSVX+6xwVFpFhWw@mail.gmail.com>
References: <CAGj5WxCrOC-SKUjrv=3RTTjx7F5n4+vLhH_7HRS1crVSnf6RuA@mail.gmail.com>
	<m2wr55jg0s.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:41561 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755762Ab2DXQaA convert rfc822-to-8bit
	(ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 24 Apr 2012 12:30:00 -0400
Received: by lahj13 with SMTP id j13so774154lah.19
        for <linux-m68k@vger.kernel.org>; Tue, 24 Apr 2012 09:29:59 -0700 (PDT)
In-Reply-To: <m2wr55jg0s.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

I wasn't aware of the differences in the divide and multiply
instructions (and that some coldfire's don't even have the division
opcodes).

Thanks for the cycle count, it makes sense.

Luis Alves


On Tue, Apr 24, 2012 at 4:39 PM, Andreas Schwab <schwab@linux-m68k.org>=
 wrote:
> Luis Alves <ljalvs@gmail.com> writes:
>
>> What's the reason for having two different algorithms for this funct=
ion?
>> The coldfire version seems faster since it doesn't perform any div/m=
ul
>> opcodes. Or am I wrong?
>
> The coldfire version would require a minimum of 1800 cycles on a 6800=
0.
> The 68000 version is dominated by either two divu (max 140 cycles eac=
h)
> or an lsr loop of max 900 cycles plus divu and two mulu (max 70 cycle=
s
> each) plus some 100 cycles for the rest. =A0That should make it bette=
r for
> all inputs.
>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756 =A001D3 44D5 214B 82=
76 4ED5
> "And now for something completely different."
