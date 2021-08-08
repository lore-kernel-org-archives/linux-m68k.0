Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130A2C432BE
	for <linux-m68k@archiver.kernel.org>; Sun,  8 Aug 2021 10:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0BF16101E
	for <linux-m68k@archiver.kernel.org>; Sun,  8 Aug 2021 10:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhHHKpR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 8 Aug 2021 06:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhHHKpR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 8 Aug 2021 06:45:17 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A908AC061760
        for <linux-m68k@lists.linux-m68k.org>; Sun,  8 Aug 2021 03:44:57 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id a7-20020a9d5c870000b029050333abe08aso744543oti.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Aug 2021 03:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9U9q0lZUKvbYE54RBYTDoIiNw159S6rYKfxs0QanQdA=;
        b=BCaXKSSv8FmRRSLzHzm5EhLBPmnNWT/0VRlgGcNrsJe2NF9ugmko/soup69ZBwzvRE
         3cUBeS6Ue/BzWCq+en/H7LbqhB8HaeqwdcbgtNLA2oHtdNuIxTt/1yy/OHPHkaOiEAEz
         ov0Pxq/QWWfQMkLvyL1avZ82+pYbZ9sg/JM6F3zNqUX+t9+XMedlCmIH7c2tPpljZaEk
         fx1NGv/vzANWdTIvlk6LrISKq6ojPebU/UvIRglJEqwnJiwN6ejk+EC3GMOHu5yBOehC
         vd+4dZPzYkn0oId536oKDEr8oRsMtnpyo14qISzrWZPFv2R8K39GZaWAg3FysPtNEOJs
         xKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9U9q0lZUKvbYE54RBYTDoIiNw159S6rYKfxs0QanQdA=;
        b=NHcCbn2JZV/kVue5TDCCLsxQdtws2Gz94aOI+se/0pxSCdkaN1Qovjy8aPdx7dkwbR
         4ES9bRMbeWfKyCDEw3cOvkW/jauiDswPEzwTe/AMQraarNDyyG3pmP4O7TurJU8Fd+nJ
         x4rn3Ahx5lnKSfGDvYI3XbgN3VLoAPbHTVIIenYgoJEV6lS5o3rO7NlTI4x4aoF83h5X
         6Zsraa+1pghgtDg3seKy0I5yJhqRZGFTAOmr1jquGZTtt1OBK4rlItFik/SaoW2CRHOd
         Zyt3HCkwZp7raT/FdMjd1PQcLl4zOCnIyZqywI90abkcNAD5z2f8mFY5qY0GVKeiCtCN
         KeGg==
X-Gm-Message-State: AOAM531TabK4GWmxTd14MDnWpuzSMcaO2kSXEVdrbIdKvwLoIU+eLktM
        0WfJyCToilzBrS8kUkO+Dy22D/A6hM5p7ho5fGw=
X-Google-Smtp-Source: ABdhPJy2xl2rUBT0EBVx9mc8SQaSdTYDIZ5+UnBlv5OtJBtHIvX0gEjsxmHl0LTo4Zn1RVIxV19ZPvTTK+kGldTW/WU=
X-Received: by 2002:a9d:749a:: with SMTP id t26mr13870019otk.370.1628419496524;
 Sun, 08 Aug 2021 03:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAM43=SM4KFE8C1ekwiw_kBYZKSwycnTYcbBXfw5OhUn4h=r9YA@mail.gmail.com>
 <31298797-f791-4ac5-cfda-c95d7c7958a4@linux-m68k.org>
In-Reply-To: <31298797-f791-4ac5-cfda-c95d7c7958a4@linux-m68k.org>
From:   Mikael Pettersson <mikpelinux@gmail.com>
Date:   Sun, 8 Aug 2021 12:44:45 +0200
Message-ID: <CAM43=SNV4016i2ByssN9tvXDN6ZyQiYM218_NkrebyPA=p6Rcg@mail.gmail.com>
Subject: Re: [BISECTED][REGRESSION] 5.10.56 longterm kernel breakage on m68k/aranym
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Linux Kernel list <linux-kernel@vger.kernel.org>,
        linux-m68k@lists.linux-m68k.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Aug 8, 2021 at 1:20 AM Finn Thain <fthain@linux-m68k.org> wrote:
>
> On Sat, 7 Aug 2021, Mikael Pettersson wrote:
>
> > I updated the 5.10 longterm kernel on one of my m68k/aranym VMs from
> > 5.10.47 to 5.10.56, and the new kernel failed to boot:
> >
> > ARAnyM 1.1.0
> > Using config file: 'aranym1.headless.config'
> > Could not open joystick 0
> > ARAnyM RTC Timer: /dev/rtc: Permission denied
> > ARAnyM LILO: Error loading ramdisk 'root.bin'
> > Blitter tried to read byte from register ff8a00 at 0077ee
> >
> > At this point it kept running, but produced no output to the console,
> > and would never get to the point of starting user-space. Attaching gdb
> > to aranym showed nothing interesting, i.e. it seemed to be executing
> > normally.
> >
> > A git bisect identified the following commit between 5.10.52 and
> > 5.10.53 as the culprit:
> > # first bad commit: [9e1cf2d1ed37c934c9935f2c0b2f8b15d9355654]
> > mm/userfaultfd: fix uffd-wp special cases for fork()
> >
>
> That commit appeared in mainline between v5.13 and v5.14-rc1. Is mainline
> also affected? e.g. v5.14-rc4.

5.14-rc4 boots fine. I suspect the commit has some dependency that
hasn't been backported to 5.10 stable.
