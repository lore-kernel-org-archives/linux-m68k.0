Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CFFEB64D7
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jun 2023 02:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjF0Czf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jun 2023 22:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjF0Czc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jun 2023 22:55:32 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7422519A4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jun 2023 19:55:31 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-401d1d967beso136291cf.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jun 2023 19:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687834530; x=1690426530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6m+wEFcEkBY8kPY3Kx1wllLpYaRIsGxbOUyAAHvddU=;
        b=ExOjo+32OkxgczlDHvAA93Sbizsv21cvgNnqKyveTvbuoZMVxqcmZEgPgSllcehguu
         dbX+ENH+6Ay2FKPsfQQPRgwk9gig7UN/Bqn5dy0/3Lt52aEGpC6a0CWZuDlLqxGVuynQ
         ePD+CMarbkoMLKhi58XFMsuv2TxpZMqD4UY8o5PNiJT66wQAkDvlNiFFn0BYTqgMvXPt
         9NcqlCm40PM9effdAviY9KeE8HRGVu4E/rigBJg7RATr+OyC7hI4fz3nHHxtdPodsK9Y
         PNjY12fUxpUwZPWspB5JgiUTyLdHqVtoy8OZEW6quF96sK7Xy1kFz342QD8ZJJbxbPpN
         +zpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687834530; x=1690426530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6m+wEFcEkBY8kPY3Kx1wllLpYaRIsGxbOUyAAHvddU=;
        b=HHiFGMzv0eGMvipwBl3JdTHoDTU0mFK3JEJ31XgU32VDQQY0nc7tdCbcB8995JLY3E
         rjClaynbBUlysYmm63os6GB38RTnROZct+xihQj18JhBJHks0xZgyljH53cFXLZYyi/J
         biaSGkktZqv6BbwHL51+7f8kc5dB2vncO4UZHWf5FUZsK2HV5SEqCOn41rtpxse6XEl/
         MgiaL0vM+nXP3NNaimFdvqqAcqaxk0pOer684X41Orn3I3tSTq7v9dAoxLWJsaCHBgOH
         6m+BxzXdZboqZkp/iIm27cjLZK96mMeLJRPSGRduXGAeaGEbS8FjTQ4ICFivW4jkDBHZ
         MDPg==
X-Gm-Message-State: AC+VfDycXBvlolu0cRqhmNC3xLxw1mRZqgF7vKJAQZhrmpdo9Rhj1A9R
        VY7Zm2SiBE/9X4DyT5kP+spWGVCvLmPEffP4pek0SA==
X-Google-Smtp-Source: ACHHUZ4HHpDDlpCkNylVwPD6Vtl3Tw7Wkd/6GWnr7BTs/XNVIfH6MktIHos0KxldS43iWx3GtWhQNV7SWLRv/Puj8+4=
X-Received: by 2002:a05:622a:d1:b0:3f0:af20:1a37 with SMTP id
 p17-20020a05622a00d100b003f0af201a37mr70012qtw.15.1687834530512; Mon, 26 Jun
 2023 19:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-7-ryan.roberts@arm.com>
In-Reply-To: <20230626171430.3167004-7-ryan.roberts@arm.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Mon, 26 Jun 2023 20:54:54 -0600
Message-ID: <CAOUHufYBSc=RKpPg4PuHduJiWKOe+vpA_rZVo-9-gFvVue0huQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/10] mm: Allow deferred splitting of arbitrary large
 anon folios
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

On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> With the introduction of large folios for anonymous memory, we would
> like to be able to split them when they have unmapped subpages, in order
> to free those unused pages under memory pressure. So remove the
> artificial requirement that the large folio needed to be at least
> PMD-sized.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Yu Zhao <yuzhao@google.com>
