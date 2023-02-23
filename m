Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F30C61DA4
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Feb 2023 14:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbjBWO3Y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Feb 2023 09:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbjBWO3Y (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Feb 2023 09:29:24 -0500
Received: from smtpq3.tb.mail.iss.as9143.net (smtpq3.tb.mail.iss.as9143.net [212.54.42.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD2A302BE
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 06:29:23 -0800 (PST)
Received: from [212.54.42.106] (helo=smtp2.tb.mail.iss.as9143.net)
        by smtpq3.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1pVCb3-0004OJ-Gq
        for linux-m68k@lists.linux-m68k.org; Thu, 23 Feb 2023 15:29:21 +0100
Received: from mail-lf1-f44.google.com ([209.85.167.44])
        by smtp2.tb.mail.iss.as9143.net with ESMTPA
        id VCb3pneE5rQ6FVCb3ppbWz; Thu, 23 Feb 2023 15:29:21 +0100
X-Env-Mailfrom: jongk@linux-m68k.org
X-Env-Rcptto: linux-m68k@lists.linux-m68k.org
X-SourceIP: 209.85.167.44
X-CNFS-Analysis: v=2.4 cv=PbA5xAtd c=1 sm=1 tr=0 ts=63f77841 cx=a_exe
 a=CHzBpAoX7KV5uG9H1SVGrA==:117 a=NxlEi8_b7Ylpj-t5:21 a=IkcTkHD0fZMA:10
 a=m04uMKEZRckA:10 a=tBb2bbeoAAAA:8 a=_Bi7TgkVfMkAY6PKytUA:9 a=QEXdDO2ut3YA:10
 a=V06SB31hTH_lka26cmxE:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Authenticated-Sender: karsdejong@home.nl
Received: by mail-lf1-f44.google.com with SMTP id k14so12991029lfj.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 06:29:21 -0800 (PST)
X-Gm-Message-State: AO0yUKW7/uAgg1RcK89WePBu+gpSxLyXe9ycULqHEsg/r8CVlj6wjpYb
        5vr4fn8lmpdsZD0g9k8G7pme4VbjazbBy2tbCyc=
X-Google-Smtp-Source: AK7set94/1/EFEemNumPPRZwWnM7I+/IOZp2jc1y+HSq5raJDR2J33hLej4urVFJuLYX2ATKaq8twWOkMJ/5KdV7lcI=
X-Received: by 2002:a19:a40c:0:b0:4db:257b:f605 with SMTP id
 q12-20020a19a40c000000b004db257bf605mr3733785lfc.2.1677162560880; Thu, 23 Feb
 2023 06:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20230223112349.26675-1-jongk@linux-m68k.org>
In-Reply-To: <20230223112349.26675-1-jongk@linux-m68k.org>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Thu, 23 Feb 2023 15:29:09 +0100
X-Gmail-Original-Message-ID: <CACz-3rjsBjum7T+dt8MGuwThwV98NnKuB-DE-Z3=VYa=nSd6-A@mail.gmail.com>
Message-ID: <CACz-3rjsBjum7T+dt8MGuwThwV98NnKuB-DE-Z3=VYa=nSd6-A@mail.gmail.com>
Subject: Re: [PATCH] m68k: fix for systems with memory at end of 32-bit
 address space
To:     linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-CMAE-Envelope: MS4xfI7JyXbpoVZZV+BhjUwbOatiw7NlSTMJyqtp7lQQCowo48+Qm5bIifGrYC9kC2805U9lysXXfZJgoZyqKGHVwLptjoxkynmlqVKTJrKnPRhLbVvpkOgV
 8fUtmDR3fIzPcqTmvr9zB/FrvrJKtxDZh9f2aSHs87vTJTQHWVypMbPPPNL96sHR3zS8iMjwaC33vWXsCwhQxc82IAmLeTpnZMsMC7YpOXJBBTyib5AZLyrL
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Op do 23 feb. 2023 om 12:26 schreef Kars de Jong <jongk@linux-m68k.org>:
>
> The calculation of end addresses of memory chunks overflowed to 0 when
> a memory chunk is located at the end of 32-bit address space.
> This is the case for the HP300 architecture.
>
> Signed-off-by: Kars de Jong <jongk@linux-m68k.org>a

Whoops, looks like I botched the "Signed-off-by" in the commit,
thinking I was in vi when it was nano.
Please remove the extra "a" at the end when you commit it :-)

Kind regards,

Kars.
