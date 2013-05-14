From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: I/O macros redefined, inconsistent across m68k machdep headers
Date: Wed, 15 May 2013 11:31:11 +1200
Message-ID: <CAOmrzk+wtQg8rYgmbvP6gcrKZzzzMFdjOmO9SnsfXWuB+B9HFw@mail.gmail.com>
References: <loom.20130511T171757-995@post.gmane.org>
	<518EED4F.7080702@gmail.com>
	<Pine.BSM.4.64L.1305121616160.6805@herc.mirbsd.org>
	<CAOmrzkLNq9Jfud-BmPojhw++GGRQvhsryfM=p=WaWrQiyr9RYw@mail.gmail.com>
	<Pine.BSM.4.64L.1305142216160.9568@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:64546 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758538Ab3ENXbM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 May 2013 19:31:12 -0400
Received: by mail-wg0-f51.google.com with SMTP id b13so1066008wgh.30
        for <linux-m68k@vger.kernel.org>; Tue, 14 May 2013 16:31:11 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1305142216160.9568@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Thorsten,

>>They are in m68k-queue on 3.9 so might to into 3.10. No idea whether
>
> Ah okay. ISTR Geert saying you had to submit them?

Correct - will do when I find a free moment. I need to tread a wee bit
carefully after being shot down in flames last time.

>>they are automatically backported to 3.8.10.
>
> Oh sorry, that was a typo, I meant 3.10 of course. Nothing is
> backported automatically.

Should be going into 3.10 vanilla if no objections are raised. The
rest has already been merged (except for the interrupt stuff, which
people may have shrugged off a a joke).

Cheers,

    Michael



On Wed, May 15, 2013 at 10:17 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Michael Schmitz dixit:
>
>>> (As a side note: will your Atari NIC drivers be in 3.8.10 vanilla?)
>>
>>They are in m68k-queue on 3.9 so might to into 3.10. No idea whether
>
> Ah okay. ISTR Geert saying you had to submit them?
>
>>they are automatically backported to 3.8.10.
>
> Oh sorry, that was a typo, I meant 3.10 of course. Nothing is
> backported automatically.
>
> bye,
> //mirabilos
> --
> Sorry,  I=92m annoyed today and you came by as an Arch user. These ar=
e the
> perfect victims for any crime against humanity, like  systemd,  femin=
ism
> or social democracy.
>                 -- Christoph Lohmann on dev@suckless.org
