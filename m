From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian kernel 2.6.38-5
Date: Mon, 9 May 2011 08:53:05 +1200
Message-ID: <BANLkTim7DMQwWQAJRR0huYT6hP5omo+aWQ@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:43209 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751634Ab1EHUxH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 16:53:07 -0400
Received: by pvg12 with SMTP id 12so2092839pvg.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 May 2011 13:53:06 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Mon, May 9, 2011 at 12:58 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Bad news: Christian T. Steigies has problems on real Amiga hardware:
>
>> However, the current (TLS) kernels have problems with the ariadne2 n=
etwork
>> card, which, I think all Amigas here but crest have (ariadne1 in cre=
st).
>> I get error messages like this with 2.6.32 and 2.6.38
>>
>> =A0eth0: mismatched read page pointers 4f vs 4c.
>
> Does that ring a bell anywhere? That=92s running 2.6.38-4 plus
> my patches, I think, so I expect 2.6.38-5 won=92t change this.

I think I've seen that on occasion on the EtherNEC  (another NE2k
variant) under heavy traffic. From all I can tell it was harmless
(i.e. TCP sorts it out for you).

The transmit timeouts look bad though - is anything ever going out on t=
he wire?

=46or some reason or other, I haven't had EtherNEC compiled in for quit=
e
some time now. Perhaps it's time to give that another good beating.
Something might have broken in the NE2k code for m68k.

Cheers,

  Michael
