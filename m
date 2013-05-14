From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: I/O macros redefined, inconsistent across m68k machdep headers
Date: Wed, 15 May 2013 10:03:48 +1200
Message-ID: <CAOmrzkLNq9Jfud-BmPojhw++GGRQvhsryfM=p=WaWrQiyr9RYw@mail.gmail.com>
References: <loom.20130511T171757-995@post.gmane.org>
	<518EED4F.7080702@gmail.com>
	<Pine.BSM.4.64L.1305121616160.6805@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:47101 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758538Ab3ENWDs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 May 2013 18:03:48 -0400
Received: by mail-oa0-f54.google.com with SMTP id o17so1351745oag.13
        for <linux-m68k@vger.kernel.org>; Tue, 14 May 2013 15:03:48 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1305121616160.6805@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Thorsten,

>> or just #undef anyway, since we can be fairly certain the previous #=
defines
>
> An #undef is always safe even if none has been made.

Right - it's just for readability really.

>> What kernel versions are these?
>
>>> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0:this i=
s the
>                      ^^^^^^

Missed that, obviously.

> As usual, when building Debian packages, I=92m using whatever the
> Debian Linux kernel team has uploaded to unstable.
>
> (As a side note: will your Atari NIC drivers be in 3.8.10 vanilla?)

They are in m68k-queue on 3.9 so might to into 3.10. No idea whether
they are automatically backported to 3.8.10.

Cheers,

  Michael

> bye,
> //mirabilos
> --
> Sorry,  I=92m annoyed today and you came by as an Arch user. These ar=
e the
> perfect victims for any crime against humanity, like  systemd,  femin=
ism
> or social democracy.
>                 -- Christoph Lohmann on dev@suckless.org


On Mon, May 13, 2013 at 4:17 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Michael Schmitz dixit:
>
>> or just #undef anyway, since we can be fairly certain the previous #=
defines
>
> An #undef is always safe even if none has been made.
>
>> What kernel versions are these?
>
>>> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0:this i=
s the
>                      ^^^^^^
>
> As usual, when building Debian packages, I=92m using whatever the
> Debian Linux kernel team has uploaded to unstable.
>
> (As a side note: will your Atari NIC drivers be in 3.8.10 vanilla?)
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
