Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2987CEB64D7
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jun 2023 12:07:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjFZMHM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jun 2023 08:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjFZMHM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Jun 2023 08:07:12 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253E2E43
        for <linux-m68k@vger.kernel.org>; Mon, 26 Jun 2023 05:07:11 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1b00b0ab0daso1858538fac.0
        for <linux-m68k@vger.kernel.org>; Mon, 26 Jun 2023 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687781230; x=1690373230;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6BMRE6JS8+5ibwX4FR+/BgjZ2fTfbLWVKMd8uHhKDTo=;
        b=hDdJhPjdQ7qACOLTxIjopFtdSj8QMNjjHgbJ4bT4EqqfInX63OUlWclMExmNKDfx5d
         yuHKgQKQ8lARCbYMJjZCyrcNYMj17nSMpDlY6Le2ZMJFjFOSpl4pSmLUSyQai6nnY9VI
         8Shrfk5y/+YDfwuS2hrCfYnjIWqTrOCOtb5Btrp0j9XXAlJs6DWGtpzx8j2YDK/bLXuH
         C0Ser/tZ8zP75c0XDqmPGLUToMXRSbv+ITetyb+cnYFSWdhvmFyaKZSjuRBrOymN2aKj
         EQ4cE1D7BdzbXLCz0G5lakCrT9EBZBB6dAEG2bDZXzeXSVx6psGaZBIziGqWQJ8JMwCG
         O5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687781230; x=1690373230;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BMRE6JS8+5ibwX4FR+/BgjZ2fTfbLWVKMd8uHhKDTo=;
        b=RUvMV3SdXFQeZK8QhA0oQbYOeZnkrXDkOQS7bm7aVrdOGBMw7UO922taMY9Xsxzg3o
         Ckt7JgPJjHRBVPnWWo6PLslpqL1vqC/PVD0bf9+pISSLy0dv0z8EV7JvFcsaCre9e+FJ
         WnadCHnQbbXjzLfh+/B/GpDKtKk7bhro/Vul2uFVIegFWbGKlLCH/aCgvJlq6wsmipE1
         agX2gd3jB5R4r6O3hBVUCcqBfjTwZnYAbulOqj+oFcOmD9RnUpKhidrLVa3FXH8v2J5v
         oEWn5yQD6bSTIggenS02RreLn9idkTYQT+N+OqHK/92TSgMtR2AKcjK+pqtwkmDZX/3T
         7iSA==
X-Gm-Message-State: AC+VfDyyowiLRbal8SByc46WMnxJAn1qx2t/nCqcsIZgBsNznx9cO76U
        h/IlJBX9JaijwdWQTQCEIu/4QGR+zRkyhl5kLOk=
X-Google-Smtp-Source: ACHHUZ4q1QfoLzbZobE4q6ToEgycuHQyrIoeBesTLsn8DoR9K9XXD450G/LtoMlykXDbXNohSAkpiqjAU3CjGTSX4f0=
X-Received: by 2002:a05:6870:c812:b0:1ad:1ce0:c348 with SMTP id
 ee18-20020a056870c81200b001ad1ce0c348mr11831216oab.11.1687781230392; Mon, 26
 Jun 2023 05:07:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6870:fb90:b0:192:629b:a66d with HTTP; Mon, 26 Jun 2023
 05:07:10 -0700 (PDT)
From:   Suelly Tamie Shinozaki <desimahoolparty@gmail.com>
Date:   Mon, 26 Jun 2023 12:07:10 +0000
Message-ID: <CAHxOeTv=KW45L-2agRciTF-dXUMuSkfqQqBA6EyU5Y10oeBP3g@mail.gmail.com>
Subject: nik_bin_nek_alwi@yahoo.com
To:     linux m68k <linux-m68k@lists.linux-m68k.org>,
        Linux m68k <linux-m68k@vger.kernel.org>,
        linux mm <linux-mm@kvack.org>,
        linux mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

https://bit.ly/3CMKoc8
