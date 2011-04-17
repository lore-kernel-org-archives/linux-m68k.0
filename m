From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH 2/2] m68k: bitops - Never step beyond the end of the bitmap
Date: Sun, 17 Apr 2011 22:50:35 +0900
Message-ID: <BANLkTin8ok0bMBM3YrcU43FVEr1MuzegBQ@mail.gmail.com>
References: <1301836277-30185-1-git-send-email-geert@linux-m68k.org>
	<1301836277-30185-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:44366 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751085Ab1DQNug convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 17 Apr 2011 09:50:36 -0400
In-Reply-To: <1301836277-30185-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Schwab <schwab@linux-m68k.org>

2011/4/3 Geert Uytterhoeven <geert@linux-m68k.org>:
> find_next bitops on m68k (find_next_zero_bit, find_next_bit, and
> find_next_bit_le) may cause out of bounds memory access
> when the bitmap size in bits % 32 !=3D 0 and offset (the bitnumber
> to start searching at) is very close to the bitmap size.
>
> For example,
>
> =A0 =A0 =A0 unsigned long bitmap[2] =3D { 0, 0 };
> =A0 =A0 =A0 find_next_bit(bitmap, 63, 62);
>
> 1. find_next_bit() tries to find any set bits in bitmap[1],
> =A0 but no bits set.
>
> 2. Then find_first_bit(bimap + 2, -1)
>
> 3. Unfortunately find_first_bit() takes unsigned int as the size argu=
ment.
>
> 4. find_first_bit will access bitmap[2~] until it find any set bits.
>
> Add missing tests for stepping beyond the end of the bitmap to all
> find_{first,next}_*() functions, and make sure they never return a va=
lue
> larger than the bitmap size.
>
> Reported-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Andreas Schwab <schwab@linux-m68k.org>

These patches look good.

I checked that find_next_zero_bit_le() and find_next_bit_le() work
as I expect.
