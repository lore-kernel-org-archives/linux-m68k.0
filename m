From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k/bitops: Correct signature of test_bit()
Date: Mon, 6 Mar 2017 11:32:52 +0100
Message-ID: <CAMuHMdXC4ECAxy7CACehVh-jfQ=RPB08qEooCyPox7OsjiLv=g__23635.7630267323$1488797241$gmane$org@mail.gmail.com>
References: <1483465970-11728-1-git-send-email-geert@linux-m68k.org> <1483465970-11728-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1483465970-11728-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, Jan 3, 2017 at 6:52 PM, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> mm/filemap.c: In function =E2=80=98clear_bit_unlock_is_negative_byte=E2=
=80=99:
> mm/filemap.c:933: warning: passing argument 2 of =E2=80=98test_bit=E2=80=
=99 discards qualifiers from pointer target type
>
> Make the bitmask pointed to by the "vaddr" parameter volatile to fix
> this, like is done on other architectures.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied, and queued for the second batch for 4.11.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
