From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 11:22:41 +0200
Message-ID: <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>
	 <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>
	 <4A8A6CA2.4040806@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-px0-f196.google.com ([209.85.216.196]:43192 "EHLO
	mail-px0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753161AbZHRJWk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 18 Aug 2009 05:22:40 -0400
Received: by pxi34 with SMTP id 34so1699468pxi.4
        for <linux-m68k@vger.kernel.org>; Tue, 18 Aug 2009 02:22:41 -0700 (PDT)
In-Reply-To: <4A8A6CA2.4040806@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

On Tue, Aug 18, 2009 at 10:56, Maxim Kuvyrkov<maxim@codesourcery.com> w=
rote:
> Andreas Schwab wrote:
>> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
>>> The need would be (a) use numbers that are very unlikely to used fo=
r
>>> normal syscalls,
>>
>> I don't understand. =C2=A0These are normal syscalls.
>>
>>> and (b) using -1..-4 for the syscall numbers works out quite nicely
>>> for the code in entry.S. =C2=A0It adds just a couple of instruction=
s to the
>>> execution path.
>>
>> Those additional instructions are totally unnecessary.
>
> Hm, I though it would be preferable to keep syscalls that are specifi=
c to
> m68k (in the sense that no other target requires them) separate from =
the
> ones implementing standard unix/linux functionality.
>
> If the consensus is that the new syscalls should received 331..334 nu=
mbers,
> that would only simplify the implementation.

I prefer to just add them at the bottom of the list.

(slowly recovering from my backlog) I noticed some new syscalls got
added recently:

| <stdin>:1515:2: warning: #warning syscall rt_tgsigqueueinfo not imple=
mented
| <stdin>:1519:2: warning: #warning syscall perf_counter_open not imple=
mented

Probably I should wire those up first (for 2.6.31, if still possible).

Next I should reserve 333..336 for you?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
