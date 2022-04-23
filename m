Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E5AC433F5
	for <linux-m68k@archiver.kernel.org>; Sat, 23 Apr 2022 09:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbiDWJvJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 23 Apr 2022 05:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbiDWJvI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 23 Apr 2022 05:51:08 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E43F195
        for <linux-m68k@lists.linux-m68k.org>; Sat, 23 Apr 2022 02:48:11 -0700 (PDT)
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M58SY-1njIpp2s9E-0016RL for <linux-m68k@lists.linux-m68k.org>; Sat, 23
 Apr 2022 11:48:09 +0200
Received: by mail-wm1-f45.google.com with SMTP id u9-20020a05600c00c900b00393e729e655so35830wmm.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 23 Apr 2022 02:48:09 -0700 (PDT)
X-Gm-Message-State: AOAM533ijKA0MYXIR6yeC6KGnGa5OSJo4gNHjqlqdfskxsberW4ZsMog
        Qa/+BCn+PXVDOb2/Mk9CCOj3NJEwMKAY0D+zBvk=
X-Google-Smtp-Source: ABdhPJzB571QS23ads9/X6bqp8kn5uvfGAj6Ip74WQj7sqmxjMCA85CiNrM4H8Eqf/GMMA0WHQ6q++BsxTECp2b2his=
X-Received: by 2002:a7b:ce15:0:b0:38e:b7b0:79be with SMTP id
 m21-20020a7bce15000000b0038eb7b079bemr7890160wmc.71.1650707289338; Sat, 23
 Apr 2022 02:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220421070440.1282704-1-hch@lst.de>
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 23 Apr 2022 11:47:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Tw+fdf-dTKfu+aFFv010u50+LhiiVBRRujfSFNrqbEA@mail.gmail.com>
Message-ID: <CAK8P3a2Tw+fdf-dTKfu+aFFv010u50+LhiiVBRRujfSFNrqbEA@mail.gmail.com>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Networking <netdev@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:46lEypBd3//jr/Dmdc3AG724kok6USurEZHvoOS5V64PrAc9+zK
 TuAMWAEhDKvJEjpGwC934lX3Odujd/HPhg/iB9WfdTlMj4XDjfjuuAtHZOFYmZuhebnxLCV
 EKYzvE1VhBb1eVWgBLnvl+K9cRi+wssw+P/4kkyt7jNXz5F4spAShC3WWWmZxUHy2BAtrPa
 AfqRuitZj6Z84Q1eiqncw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LLLFaAd9rNQ=:iKqLKe16wr/fI8N55mtgIJ
 kDr9NRtFt0S/3DyC699jd43MtXGozPzJURtozXa+fBlXya2omqAuUvlCxBS4WM0RfJBCCKtR/
 uBF6EdkyF+Cdv2y+BCYp5LwbLGeWgFdxfbi0rhqtzGJRyp0fPJMGu7qjW9NNBPsduKsgFTCAD
 sNvY3mu5iPpfzfnQ/a3aR9oVg1+XClcPc6IQ8HI7CQ+BbgSF/9Y5ydz5SuVSCLGpL9f/wd0ri
 Yy65TDMYVnZHb1jvrVwio0MfqQKAZJR3LJV6Zp2NW9m8q+sl07TqeGqHFFK8oorAuLBVwLNFo
 QwfIaHZCydAlUcqJzwNAGinP0zBt7QEGkScP3r3q3lQ/uNt4PCmCTz7lBnUEM/IMFMnZhWq1y
 YuJ7uhUo2/1MvCTSp2fEjQn+/GXSaCqk4HptF66wQxXxBx8leCp9JpJ9lpOi1W9V1x/q3cmHs
 p+Pb7HP04+YVfQDwRxCYkDVEZZZIpbM+R3t8dAOhmH6vUDVbv3hyzusWilXYPaY2QRhENvRNE
 P9CXm3kZn2HWO8ZQirTodv+LmMIkVAzlF1dy2nV32tMeyYn8O2tLr7xxPcaq2FMgW0Lb6KsP9
 kSoTboyK/GRnQ7Recrk22JZrAsqW39P4l3huoVrsQux8Aj5ZrqNTpGqr0sBM12R5pqshMmT+V
 R+VA0JAUbVmxXs5MvdNFCjH3neXuzh/Vur1h1CmZxiy8cxqK27vi4iblJsuzYbmX5cdM=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 21, 2022 at 9:04 AM Christoph Hellwig <hch@lst.de> wrote:
>
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>
