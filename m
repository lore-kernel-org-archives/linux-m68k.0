Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF80EC6FD1C
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Mar 2023 08:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjCWIT2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbjCWIT1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Mar 2023 04:19:27 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219902FCD3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 01:19:24 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id t13so13707704qvn.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 01:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679559564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndSJdmu180CNxuWSsFyiy3E2XCeyZmME4SDQAwPws9k=;
        b=gzjGcay5j7gnRQEznMUJQdlpnqsUGIvoWWLEQZv54FGvff5vvjiOpWx40CYqsANDaW
         udelhPTGtb+XqMHpgGYhJUW9w8bhg7wWKAO30tCaqEP91KU3mkSRbpd9qZg40qHBTwc2
         LMYR0VemVMK6YlAFq887P+MR2Io6HvxqIzY7jK0FZUsNIGU11rW2stb/v/1DIEbuT5ga
         zuF6rF+JoWepnpzOfVB75eGxYmSkGBtCyqULuv91rANo0GBrXGlG+6O7S1Tx19Ot1tXe
         gz92qxKAvukNPD5B1szo+907WdOz7sHyRDE090u158rjymsPN3Is4fASxJpMwMOnqOEh
         XLGA==
X-Gm-Message-State: AO0yUKXjp70tKYkpF0JL0wMrAaEUAFj9GnnKFc4/0kjyXLw3Xq9qK+e5
        KZvnKVLGckY/mjQP4EGqa1tS6oJyCrku0g==
X-Google-Smtp-Source: AK7set+auOrN0RlQCyKsKnEH/QFuZFwKNzCYcDcqImHjs3zpQepQDmwuRreO3FBNwzUvTLU2PY6Azw==
X-Received: by 2002:a05:6214:2a81:b0:5cd:f9fd:f66d with SMTP id jr1-20020a0562142a8100b005cdf9fdf66dmr10237142qvb.18.1679559563659;
        Thu, 23 Mar 2023 01:19:23 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 11-20020a37060b000000b0071d0f1d01easm6735649qkg.57.2023.03.23.01.19.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:19:23 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id x198so14142634ybe.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 01:19:22 -0700 (PDT)
X-Received: by 2002:a25:800d:0:b0:b3b:6576:b22b with SMTP id
 m13-20020a25800d000000b00b3b6576b22bmr1678849ybk.12.1679559562517; Thu, 23
 Mar 2023 01:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <5b7c473247d66776343d82a55b9815195b1b11fb.1679551394.git.fthain@linux-m68k.org>
In-Reply-To: <5b7c473247d66776343d82a55b9815195b1b11fb.1679551394.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Mar 2023 09:19:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJ6kbpYGTjyY5dX+-YRv3pL0ydG3HQ-H1khyeqLOa05A@mail.gmail.com>
Message-ID: <CAMuHMdUJ6kbpYGTjyY5dX+-YRv3pL0ydG3HQ-H1khyeqLOa05A@mail.gmail.com>
Subject: Re: [PATCH v2] nubus: Don't list card resources by default
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Thu, Mar 23, 2023 at 7:02 AM Finn Thain <fthain@linux-m68k.org> wrote:
> Some Nubus cards have many ROM resources. A single Radius video card
> produced well over a thousand entries under /proc/bus/nubus/. Populating
> /proc/bus/nubus on a slow machine with several such cards installed takes
> long enough that the user may think that the system is wedged. All those
> procfs entries also consume significant RAM though they are not normally
> needed (except by developers). Omit these resources from /proc/bus/nubus/
> by default and add a kernel parameter to enable them when needed.
> On the test machine, this saved 300 kB and 10 seconds.
>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> Checkpatch says "externs should be avoided in .c files" and if this one
> appeared twice I would agree. But as it only appears once, I can't see
> any advantage to putting it in a new .h file instead of the .c file...

The advantage is that it allows the compiler to check that the
signatures of the declaration and the definition do match, now and in
the future.

> --- a/drivers/nubus/nubus.c
> +++ b/drivers/nubus/nubus.c
> @@ -34,6 +34,9 @@
>
>  LIST_HEAD(nubus_func_rsrcs);
>
> +bool procfs_rsrcs;
> +module_param(procfs_rsrcs, bool, 0444);

With the expanded functionality, is "rsrcs" still a good name?
Perhaps this should be an integer, so you can define different
levels? E.g.
  - 0 = just devices
  - 1 = above + boards + public resources
  - 2 = above + private resources
(disclaimer: I know nothing about NuBus and the current /proc/nubus
 layout)

Should this be documented?
I know there is currently nothing about NuBus under Documentation/.

> +
>  /* Meaning of "bytelanes":
>
>     The card ROM may appear on any or all bytes of each long word in
> @@ -574,7 +577,9 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
>                 default:
>                         /* Local/Private resources have their own
>                            function */
> -                       nubus_get_private_resource(fres, dir.procdir, &ent);
> +                       if (procfs_rsrcs)
> +                               nubus_get_private_resource(fres, dir.procdir,
> +                                                          &ent);
>                 }
>         }
>
> diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
> index 2c320a84fd72..844e86636798 100644
> --- a/drivers/nubus/proc.c
> +++ b/drivers/nubus/proc.c
> @@ -51,11 +51,13 @@ static struct proc_dir_entry *proc_bus_nubus_dir;
>   * /proc/bus/nubus/x/ stuff
>   */
>
> +extern bool procfs_rsrcs;
> +
>  struct proc_dir_entry *nubus_proc_add_board(struct nubus_board *board)
>  {
>         char name[2];
>
> -       if (!proc_bus_nubus_dir)
> +       if (!proc_bus_nubus_dir || !procfs_rsrcs)
>                 return NULL;
>         snprintf(name, sizeof(name), "%x", board->slot);
>         return proc_mkdir(name, proc_bus_nubus_dir);
> @@ -72,7 +74,7 @@ struct proc_dir_entry *nubus_proc_add_rsrc_dir(struct proc_dir_entry *procdir,
>         char name[9];
>         int lanes = board->lanes;
>
> -       if (!procdir)
> +       if (!procdir || !procfs_rsrcs)
>                 return NULL;
>         snprintf(name, sizeof(name), "%x", ent->type);
>         remove_proc_subtree(name, procdir);
> @@ -157,7 +159,7 @@ void nubus_proc_add_rsrc_mem(struct proc_dir_entry *procdir,
>         char name[9];
>         struct nubus_proc_pde_data *pded;
>
> -       if (!procdir)
> +       if (!procdir || !procfs_rsrcs)
>                 return;
>
>         snprintf(name, sizeof(name), "%x", ent->type);
> @@ -176,7 +178,7 @@ void nubus_proc_add_rsrc(struct proc_dir_entry *procdir,
>         char name[9];
>         unsigned char *data = (unsigned char *)ent->data;
>
> -       if (!procdir)
> +       if (!procdir || !procfs_rsrcs)
>                 return;
>
>         snprintf(name, sizeof(name), "%x", ent->type);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
