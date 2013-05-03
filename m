From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] nubus: Kill nubus_proc_detach_device()
Date: Sat, 04 May 2013 00:10:16 +0100
Message-ID: <24064.1367622616@warthog.procyon.org.uk>
References: <1367612438-26490-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1367612438-26490-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dhowells@redhat.com, Al Viro <viro@zeniv.linux.org.uk>, David Huggins-Daines <dhd@debian.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Commit 59d8053f1e16904d54ed7469d4b36801ea6b8f2c ("proc: Move non-publ=
ic
> stuff from linux/proc_fs.h to fs/proc/internal.h") broke Apple NuBus
> support:
>=20
> drivers/nubus/proc.c: In function =E2=80=98nubus_proc_detach_device=E2=
=80=99:
> drivers/nubus/proc.c:156: error: dereferencing pointer to incomplete =
type
> drivers/nubus/proc.c:158: error: dereferencing pointer to incomplete =
type
>=20
> Fortunately nubus_proc_detach_device() is unused, and appears to have=
 never
> been used, so just remove it.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

=46ine by me.

Acked-by: David Howells <dhowells@redhat.com>
