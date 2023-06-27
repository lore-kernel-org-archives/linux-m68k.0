Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8527AEB64DA
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jun 2023 03:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjF0DHB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jun 2023 23:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjF0DG7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jun 2023 23:06:59 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E0410C
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jun 2023 20:06:58 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-401f4408955so92861cf.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jun 2023 20:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687835217; x=1690427217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHjDKRRl/15ekTuy08miOOxy3w0/yhMNRIiKSHMWeKc=;
        b=U+XAZ3T2dIrYSDRflvSR1rmzQYNaCDWIXrwa1SuzZyMaNy4R1Z9M7iKbPChbnEUUcN
         HbNR42w6rgICSGyutbOx3FUPFNrEn/y7PrelQZJmyCIivX/xaF9v3GFiJpnhAtYeu4RI
         /ZCmbFdAX8t40oXyMcprKrsltgmdVNvgUKpuOluQcm4IA1tHAnjOewZE9hAeGjLHQPzC
         F4j8dAcFO/tUYsA1CRgw8DhT52AI7ytP29bgeMTekvzrlL0PghVPLmiES2dlOXNuNOv9
         MjlQKW2/dQnNI81iD4ySLmnOu8yM7NHqS0Y6SWD1+C1voL+3X694zE5VmhYQ+Sl+KeBK
         q2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835217; x=1690427217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHjDKRRl/15ekTuy08miOOxy3w0/yhMNRIiKSHMWeKc=;
        b=HP8yZYBeJJSsvneehFkRomBdEOV2OucxfXXhLZRIw4ZCfwauLYTl70iruNxa87cLMQ
         N6xtcBZ4690EycDXb2z4PkJgd3tou/SyC2jR4v5cGU4JKz8SIdbLWnCOUl6wwmzieQFa
         we4St73Ozl5MkqS96SN3HxMTaJYpP3lQYbbPmuHbE/RMAa3VP1rRLdyMTCTiSm7+nRZr
         AEA8efph9xiSr8oPkz1gAMBOjWWxlColfvHr9sCv/XlOaeFi1H4PBJDPvbmK06H7w1cr
         Cpcd3iQd6Eet5K4R8lD8oHCgyuJeZgdGpjZDvTt+7i44lRlUTIh76s81hmMnJ871hBMV
         EI5w==
X-Gm-Message-State: AC+VfDzTMXkgNpGgd4mJakSZgQ/2cU8EjRnuuh8zipx/Lw7XdzQXFB0h
        gm2ULYEWLkONEzkHlpGg8AXpX3ToP84LImtO51zV5Q==
X-Google-Smtp-Source: ACHHUZ5p5sW4PXCHzSz3Bi+SKvcosf62y2SJQOFc8Eaih/xwzKdQqVu4Rv48gDYQD7M4asyor1cgbPKZvcH6CWAHIzY=
X-Received: by 2002:ac8:59c1:0:b0:3e8:684b:195d with SMTP id
 f1-20020ac859c1000000b003e8684b195dmr619236qtf.10.1687835217476; Mon, 26 Jun
 2023 20:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-6-ryan.roberts@arm.com>
In-Reply-To: <20230626171430.3167004-6-ryan.roberts@arm.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Mon, 26 Jun 2023 21:06:21 -0600
Message-ID: <CAOUHufZB=E5jW2O_ASuGUP=X-PfVUSFxOCvC=YU1_WwJiQCibA@mail.gmail.com>
Subject: Re: [PATCH v1 05/10] mm: Implement folio_remove_rmap_range()
To:     Ryan Roberts <ryan.roberts@arm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        David Hildenbrand <david@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> Like page_remove_rmap() but batch-removes the rmap for a range of pages
> belonging to a folio, for effciency savings. All pages are accounted as
> small pages.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/rmap.h |  2 ++
>  mm/rmap.c            | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)

Sorry for nagging: this can be included in a followup series.
