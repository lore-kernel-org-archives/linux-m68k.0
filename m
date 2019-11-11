Return-Path: <SRS0=YN9G=ZD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03438C43331
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:34:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D72D9214DB
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfKKKeJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Nov 2019 05:34:09 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:40081 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfKKKeJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Nov 2019 05:34:09 -0500
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M4Je5-1iTpuD02zp-000KnL for <linux-m68k@lists.linux-m68k.org>; Mon, 11
 Nov 2019 11:34:08 +0100
Received: by mail-qk1-f182.google.com with SMTP id 205so10730370qkk.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2019 02:34:07 -0800 (PST)
X-Gm-Message-State: APjAAAWzMJYbndcKlwOfgNUKdqiHCe+J592haZESVZqXoc/K5i2RKIur
        EKEezPKQ0JCkrWQCeN/nLFWDOcTUZEM0odYE+fE=
X-Google-Smtp-Source: APXvYqzESzY62F14rsigxKLBXM91nKVjfO+E517KtV1rTG3fdeRCW+MOilAesC4Pz85XDKVkv4qCW/mxeD7p5CII2Ks=
X-Received: by 2002:a37:4f13:: with SMTP id d19mr9320005qkb.138.1573468446947;
 Mon, 11 Nov 2019 02:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de> <20191029064834.23438-2-hch@lst.de>
In-Reply-To: <20191029064834.23438-2-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Nov 2019 11:33:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3xk-mQic84Cv7CYhm2DqDCyu69+qH=i8M=JoE3xkpM=g@mail.gmail.com>
Message-ID: <CAK8P3a3xk-mQic84Cv7CYhm2DqDCyu69+qH=i8M=JoE3xkpM=g@mail.gmail.com>
Subject: Re: [PATCH 01/21] arm: remove ioremap_cached
To:     Christoph Hellwig <hch@lst.de>
Cc:     Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        "moderated list:NIOS2 ARCHITECTURE" 
        <nios2-dev@lists.rocketboards.org>, openrisc@lists.librecores.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xka6P2PSJXySnLWy14QzUx4XSXVAKQy3BBCItgnM2v6hwnXfoMa
 5GqwSIbl+QNynMeWIXJCnrLIHfwSa25TrtOy+FuLojSU1PnLndpUpbhjpUSkvM+VSC9UMNh
 3X7aP8bUc+9jxuDqlCrmC1J6nL6HDYLbz2sXVZO8zYEkCdN7huNfkRV1TQEezKzJ6oB/weg
 uNPk2GRJ7NLXipCp5Nb2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zNEE5yesyQI=:FJSCVuK3JOEWi5ZiWGGsOf
 o54A6diUGDVuje8dVw0MIEzcHKwGuyOU+OM2qgMkwLSsuHCV8YsJUC6Q8W0eesdpZ+zxqfJRx
 KcDgufs0hbEyJHsRmW3KNIT1fdoT2zIZTQtBnHSCTuJayU5C4WEdo1nNEhSN6gORyuaerql4v
 qcv6dTRWhqxX7KwG2rXMpbcvdrE6Lffnh6FjwZ047s4OXNamSfqSUpnMRzGmwqKun0GSvee1e
 Ee6CHGOefrlm1otWVIJnshCofO8oREPbIpk8sVNy13htX5Bgxbnee8urOmyVpwHz47jAYyx0u
 D0hl9su3OSERDlEj9xEhkM8dlgxXlGtv2iDgw+S5fhxpp1co13Z9JOurex9Sp8ab371LthOhZ
 5RM/XhyhGgF3U1GEXd7ZwstOYHj9Ful/iQELJwWvvw3Nbws/wL9NnhlHBFXYvL/Mys21HHHRH
 f5tMSztb+xaauDM8UoWpPxZw9e7T+yDw61h9vDhQSkqwcQiVaS0l19Xc4uIEp84rImi33rAo9
 xnYD0DunGpkZEydt1QeGDTNU5C+bRlOtGkgjEhtk2emont/xGsuoMbZu2yKws/EuvFD9hUHN0
 aGFg84lBx/pGTvxLGVnT+5fJ5oz7pulZdm4YSVv6onesbwD+p4MPi7pIx+n6Xp7Q3UREdIDlS
 JkQhnk3WqDHmguOu4VlqKo4eUu3LX9zDHnoFfdGuVL/5JzQUAHpEvcWWIcuaGsmJRik7La6qb
 Q+rljYSvVYomljq26fxSbpmPHeuvedNn3z4Uddv2v+12fHev8H9JExaC+uCZKGsWdT+adEWTs
 KIFAilV6xizxGhQzpX0AP1ErwEGQ6F1zxyHRGlLs7yUum1mp1bgCsGMW5HhM+tqyO9stHH7Fk
 M6FjVRFw7XM/JahkCTPw==
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 29, 2019 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
>
> No users of ioremap_cached are left, remove it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
