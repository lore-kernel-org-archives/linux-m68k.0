From: Lars Michael <lh_post@yahoo.com>
Subject: Re: Coldfire v4 low performance of read/write to shared memory
Date: Thu, 7 Mar 2013 02:01:39 -0800 (PST)
Message-ID: <1362650499.60247.YahooMailClassic@web125606.mail.ne1.yahoo.com>
References: <1360754406.53672.YahooMailClassic@web125605.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1360754406.53672.YahooMailClassic@web125605.mail.ne1.yahoo.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: lh_post@yahoo.com

Lars Michael <lh_post <at> yahoo.com> writes:

At the same time we noticed (by using strace) that there is an excessiv=
e and=20
continously sequence of system
calls at normal program execusion:

333 (__NR_GET_THREAD_AREA), and 335 (__NR_ATOMIC_CMPXCHG_32)

Thorsten Glaser <tg@xxxxxxxxxx> wrote:

Yes, that is in fact normal. If you stop using programs (and libraries)
that use TLS (thread-local storage) and atomics, you=E2=80=99ll notice =
a massive
speedup as these syscalls will no longer be issued.

The only way out of this is an ABI breakage, with at least
* set one CPU register aside for the TLS base
* add a VDSO or some other kind of page for =E2=80=9Cfast syscalls=E2=80=
=9D,
  to optimise away the need for cmpxchg to call into the
  kernel (if possible), and maybe speed up e.g. gettimeofday
* bump time_t to 64 bit (pet peeve of mine)
* =E2=80=A6 maybe others? I=E2=80=99m not a Linux kernel coder.



Thorsten, thanks for commenting. I am not really familiar with all this=
, but given what you say is true, is it fair to say that the ColdFire v=
4 is a 'less optimal' processor for running Linux? A thing to add is th=
at there are no free register left for a TLS base.

Does anybody have really good experience with running Linux on the v4?

Thanks
Lars Horvath
