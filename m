Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A8AEC873F
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 15:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233904AbjIGPxv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236979AbjIGPsX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 11:48:23 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4314469F
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 08:39:40 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68e4700c931so272754b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Sep 2023 08:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101079; x=1694705879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHLh0XIuAU9BJlqzEfpp7VQfwKfBKemsHfjkdXxbouo=;
        b=ToLRFYknuufuctYv6nZpqC/4xQ8RAEeaBkbiEzM3LRFmniMnM3t7V2bZsE8aKveXLP
         b0kj+x2p12G10CElm6OzTFk5TUATnhit3Tw6TTGcH50EbI2rcdDfYnBFA1hc6afxw+eo
         +4Um9qPHOS7WaIL+MwZfkjBk2iANBiLZwmT14aj0+uvJRBX0QCulQUX/QZKSmFv25Nzj
         ajByrWEjhYDuzLPHGITs/aKuQFKP44pHubmtAr+r0bxVVU+04ZmmdLFtg98mfbKNSdQl
         HiM1JCqX5U1UJQLNOcWXmMrIuAXWzAy2JwVolaFABTGrgY4MBoftGu+snwPWCDRa/VsE
         9w6A==
X-Gm-Message-State: AOJu0YzGXpMbI7L5ansY2iJ30Cv2S1QgZ2E/Z+cyP7yQg5fqDejCJxC5
        bxg8bddQ/Z7OlYmc+ZVBYpOsy/DwhJbTQA==
X-Google-Smtp-Source: AGHT+IEdINUVq1xdBK0tXNs0I2fQ3kH+09zSOxaiC2B/TuikYJO6kIo4fUB46sTMQ8izJw9Z6SriEQ==
X-Received: by 2002:a05:6830:32aa:b0:6bc:88da:af44 with SMTP id m42-20020a05683032aa00b006bc88daaf44mr20270001ott.6.1694097386477;
        Thu, 07 Sep 2023 07:36:26 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id t78-20020a25aad4000000b00bcd91bb300esm3819273ybi.54.2023.09.07.07.36.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 07:36:25 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d78328bc2abso970722276.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Sep 2023 07:36:25 -0700 (PDT)
X-Received: by 2002:a25:ad91:0:b0:d2c:32cb:c631 with SMTP id
 z17-20020a25ad91000000b00d2c32cbc631mr20648715ybi.27.1694097385344; Thu, 07
 Sep 2023 07:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694095086.git.geert@linux-m68k.org> <5c80dc63-e7d0-5d82-de83-7e35c54b8351@csgroup.eu>
In-Reply-To: <5c80dc63-e7d0-5d82-de83-7e35c54b8351@csgroup.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Sep 2023 16:36:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzOsAa1qtnqBP0Wr_AaTGWUnxVHnWryoCDPX0d-v1EBg@mail.gmail.com>
Message-ID: <CAMuHMdWzOsAa1qtnqBP0Wr_AaTGWUnxVHnWryoCDPX0d-v1EBg@mail.gmail.com>
Subject: Re: [PATCH 0/2] m68k/powerpc: Kill references to non-existent README.legal
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux SPDX Licenses <linux-spdx@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christophe,

On Thu, Sep 7, 2023 at 4:25 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 07/09/2023 à 16:21, Geert Uytterhoeven a écrit :
> > Several source files contain license boilerplate that refers to the file
> > "README.legal", which never existed in upstream Linux.  This is a relic
> > from the early port of Linux to the m68k processor family, before it was
> > merged in v1.3.94.  Later, copies of this boilerplate ended up in the
> > PowerPC port.
> >
> > The "README.legal" file (from e.g. [1]) read:
> >
> > ---8<-----------------------------------------------------------------
> > Legal information about the Linux/68k software package
> >
> > All files contained in this archive are copyrighted by one or more
> > person.  They are not in the public domain.
> >
> > Most of the files are copyrighted by Linus Torvalds, the original
> > writer of Linux for IBM PC clone systems.  Some parts are copyrighted
> > by other IBM PC linux developers.  Other parts are copyrighted by
> > Linux/68k developers.
> >
> > This package is subject to the terms and conditions of the GNU General
> > Public License.  A copy of this license may be found in the file named
> > "COPYING" which should be in the same directory as this file.  If the
> > file has been omitted, you may obtain it by writing to the Free
> > Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> > ----------------------------------------------------------------->8---
> >
> > Note that the "COPYING" file at that time corresponded to the version
> > from upstream Linux v0.99.11 until v2.1.104, and thus predated the
> > addition of the "only valid GPL version is v2" clause in v2.4.0-test8.
> >
> > This patch series gets rid of the references to README.legal by
> > replacing the boilerplate with SPDX license identifiers.
> >
> > Thanks for your comments!
>
> As far as I know this kind of patch has to be copied to
> linux-spdx@vger.kernel.org

Thanks, added to CC.

> > [1] https://www.ibiblio.org/pub/historic-linux/ftp-archives/tsx-11.mit.edu/Oct-07-1996/680x0/v0.9/linux-0.9.tar.gz
> >
> > Geert Uytterhoeven (2):
> >    m68k: Replace GPL 2.0+ README.legal boilerplate by SPDX
> >    powerpc: Replace GPL 2.0+ README.legal boilerplate by SPDX
> >
> >   arch/m68k/68000/entry.S             | 7 ++-----
> >   arch/m68k/bvme6000/config.c         | 5 +----
> >   arch/m68k/coldfire/entry.S          | 7 ++-----
> >   arch/m68k/ifpsp060/Makefile         | 6 ++----
> >   arch/m68k/kernel/entry.S            | 7 ++-----
> >   arch/m68k/kernel/head.S             | 8 ++------
> >   arch/m68k/mvme147/config.c          | 5 +----
> >   arch/m68k/mvme16x/config.c          | 5 +----
> >   arch/m68k/q40/config.c              | 5 +----
> >   arch/powerpc/kernel/ptrace/ptrace.c | 5 +----
> >   arch/powerpc/kernel/signal.c        | 5 +----
> >   arch/powerpc/kernel/signal.h        | 7 ++-----
> >   12 files changed, 18 insertions(+), 54 deletions(-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
