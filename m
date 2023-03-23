Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4A3C6FD1D
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Mar 2023 09:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjCWJkV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Mar 2023 05:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbjCWJjs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Mar 2023 05:39:48 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FBCF957
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 02:39:46 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id iw3so21762638plb.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679564386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx1cWbW8skW+J91S4nIUH2+PrWy6/cJUo3hRxlmG+G4=;
        b=pCQdPrCYjY2EZyqDFB6ur/y+zD7pfxrqPKXJ6qROgn8YzstnagOQ80gua0e1yJf5be
         Iio59oXde7Wup+LLoxrsV6D9TeOXDdjIwSR0uzeN8xXXiJrpqDFsl3PPA9Bn/1zF3BIo
         YLwOlu/RQCnP/HzzbsPc80+gLMzoDTJiFBHeGDoqzkTbPeTcgvhX6vrX/IYCDMIOQ+lF
         oU3W9kqDe16PxbF7PpEZ1wobldylApgBPHSg1aCrJv/TSvboroNCYTId4WKXpZR8qvGg
         BPHyb212ZPe8k9S2ggTMwGgiVnV72nO1xLe9xzULnDLsdD1LalTMpJY686VYZd+oZ85l
         A86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679564386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zx1cWbW8skW+J91S4nIUH2+PrWy6/cJUo3hRxlmG+G4=;
        b=mBWtkFfS7AdlC6oe5/dUbeJFSnCYvyhik8HroYt8YTPnqY8rcGiRudTXZooij2xKPR
         ANIr7Bn6zemBu3ANM11rT8s5P+p1giS+a0HbD0CsmHoi2fjSecQiH/hhEPLESdIjakvB
         jEWQ0n+HW2ECR6U55S8xrpQyw6mAoPYLIXNTudsytIiDOeciAcOvNgWAB2b4GjwKNxxG
         LYNHiddv6RM6BzF/hmoLV+s0GxURhcE4UirS40yzEpcS+zXbUsiXigofz/1XgnWKgdnH
         L+uQwu2uIaIBgpIo24B8S7RcQWrUszQNrLeX9jXs8dEFGoDL48W7q3UIaIG9wQduuTOU
         x/1A==
X-Gm-Message-State: AAQBX9e5btJy0+A6KCYP6rEitrJdpWaEnd3nCaQOfJDvt94qlXJZHU03
        9H7becdGc0B5JOnez2Km0BYH5nR85pcAW2yQDME=
X-Google-Smtp-Source: AKy350bCAexRMlOcrYwrCk12cMPtsoPYJWZ/XiHrtIhAZ4B6tk5Hhx8gC4VdgE3XYHEjClHtI+16JTGrwgF9+BfNLfM=
X-Received: by 2002:a17:902:b687:b0:1a1:ffc5:1e8d with SMTP id
 c7-20020a170902b68700b001a1ffc51e8dmr942230pls.3.1679564386271; Thu, 23 Mar
 2023 02:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230323092156.2545741-1-rppt@kernel.org> <20230323092156.2545741-15-rppt@kernel.org>
In-Reply-To: <20230323092156.2545741-15-rppt@kernel.org>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Thu, 23 Mar 2023 02:39:34 -0700
Message-ID: <CAMo8BfJtCgak4mbeZ2R61EEWz+HYYhK-KOz+XJ+fhLY+zFgajA@mail.gmail.com>
Subject: Re: [PATCH 14/14] xtensa: reword ARCH_FORCE_MAX_ORDER prompt and help text
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guo Ren <guoren@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Zi Yan <ziy@nvidia.com>, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mm@kvack.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Mar 23, 2023 at 2:24=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The prompt and help text of ARCH_FORCE_MAX_ORDER are not even close to
> describe this configuration option.
>
> Update both to actually describe what this option does.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/xtensa/Kconfig | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
