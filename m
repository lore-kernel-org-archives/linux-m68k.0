From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/14] nubus: Repopulate /proc/bus/nubus/s/
Date: Mon, 13 Nov 2017 09:56:35 +0100
Message-ID: <CAMuHMdUCWzmGNyPp0OV-XFvtyTcxCgW-eLKdxnkd0gg_rGToVw@mail.gmail.com>
References: <cover.1510377368.git.fthain@telegraphics.com.au> <51c5a1526bbf522bbb76d6a71040c220e7e72a8a.1510377369.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:49794 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751585AbdKMI4g (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Nov 2017 03:56:36 -0500
In-Reply-To: <51c5a1526bbf522bbb76d6a71040c220e7e72a8a.1510377369.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Finn,

On Sat, Nov 11, 2017 at 7:12 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Create the /proc/bus/nubus/s/ inodes while scanning slot s. During
> descent through slot resource subdirectories, call the new
> nubus_proc_add_foo() functions to create the procfs inodes.
>
> Also add a new function, nubus_seq_write_rsrc_mem(), to write the
> contents of a particular slot resource to a given seq_file. This is
> used by the procfs file_operations methods, to finally give userspace
> access to slot ROM information, such as the available video modes.
>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thanks for your patch!

> ---
>  drivers/nubus/nubus.c | 117 +++++++++++++++++++++++++++-------
>  drivers/nubus/proc.c  | 170 +++++++++++++++++++++++++++++++++++++++++++++++---
>  include/linux/nubus.h |  35 ++++++++++-
>  3 files changed, 288 insertions(+), 34 deletions(-)

Wow, that's much more code added than was removed by "[PATCH 10/14] nubus:
Depopulate /proc/bus/nubus/s/":

 drivers/nubus/proc.c  | 100 --------------------------------------------------
 include/linux/nubus.h |   1 -
 2 files changed, 101 deletions(-)

How much memory is saved by not using the stored representation of
slot resource data?

BTW, should 10 and 11 be combined, to avoid a regression during bisection?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
