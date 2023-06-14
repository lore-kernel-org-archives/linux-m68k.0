Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9118AEB64D9
	for <linux-m68k@archiver.kernel.org>; Wed, 14 Jun 2023 11:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbjFNLCE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 14 Jun 2023 07:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbjFNLCD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 14 Jun 2023 07:02:03 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64774109
        for <linux-m68k@vger.kernel.org>; Wed, 14 Jun 2023 04:02:02 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-62de398267aso8501836d6.1
        for <linux-m68k@vger.kernel.org>; Wed, 14 Jun 2023 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686740521; x=1689332521;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QGhaNsS7W/dmFyZfmhMJXui24jjSS9U0u092+cgeJ+M=;
        b=i0MT49wh6+Z9DoAZkZuytprga+LkTgwGUdHNAXr5M18wWov3SIhzChEurdfHsrG0EG
         JTZ5nWt0aKPL6gPJsSot/Z5X4gBLzzwjPPPghkVogUy/nOli+JEHKvQqYG9q1AyOmZiS
         qWF6naBfHPfEY4S3Ji1kUXfIM8MsMBH5U+NMj0PKaVN7LsFIwrlJwgHfdRhVoHLcH53A
         G66R47qh+G5aDoXo3sYqCHOUrzz6GZW555HRUcrYPAMW5+8uCFv8jIoWjzJTuKps7ilZ
         jgc99Im626AgmGcpUrCqz5Dsvv6ykZKcxs4Mhjkqk5urYY9Z7rnK3Uy0lAm9BSqF7SV7
         PEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686740521; x=1689332521;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGhaNsS7W/dmFyZfmhMJXui24jjSS9U0u092+cgeJ+M=;
        b=L8SNVhcqLFz/s2cHl0yXx/Js3ZPLjXOcuLsctqkyXKOn69Bnfccv8rx4T3aXOV4iFs
         ZeRNzxWj/wasQGlfxUU2mJLBq9JeAMZKhQE/nFgOQZ65uk8iwao+nytncAGJB4cL3PG5
         9yWc4C8Qno8xqjgwJnOv19cEODugsldfdf7DpIv0ajTQLSl7jjKVb4xDeoAednh5M6bB
         A9uyx5sZiHyZVdDsNzODMjXH4LffPvvTyNUAoHTqX0p1qt6Hwhunjy9VbVPnI3SjLJGV
         Oqp0YB6B5FTKx9SI4ckj0dxELyFvjODsyz7+stLlWUXey6XrLxHi9h/5l7mNiMN039fb
         sdzA==
X-Gm-Message-State: AC+VfDy9/Kuq6wkqfcpFZb/WUojP/gOfxjRErtatmBvYHXZNisZ7yvrX
        YHRombDsjT1vb4RdLXo3S5/7/hu53OZ6nG90ckU7LLkjQbo=
X-Google-Smtp-Source: ACHHUZ4jfL2Dpcw2lgF50Qm7+oc8D7fii//jt4OgUhBfwdc4E41IWNBEZ9BBKecqcoLrgS6VL6QhoWz6ZSvGubczlK4=
X-Received: by 2002:a05:6214:411b:b0:62f:e386:1e45 with SMTP id
 kc27-20020a056214411b00b0062fe3861e45mr1441995qvb.1.1686740521222; Wed, 14
 Jun 2023 04:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:1207:b0:3e6:3c7f:5aec with HTTP; Wed, 14 Jun 2023
 04:02:00 -0700 (PDT)
From:   Xavier Cuenca <xcuenca1993@gmail.com>
Date:   Wed, 14 Jun 2023 11:02:00 +0000
Message-ID: <CAHDEakqCyWm7qrrr59k-dpL+=3Zh-ExUSFQ99DY1t0YvJBa-uA@mail.gmail.com>
Subject: nik_bin_nek_alwi@yahoo.com
To:     Linux m68k <linux-m68k@vger.kernel.org>,
        linux mm <linux-mm@kvack.org>,
        linux mtd <linux-mtd@lists.infradead.org>,
        linuxppc dev <linuxppc-dev@lists.ozlabs.org>,
        Luis Alves <ljalvs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

http://tracking.groupon.com/r?tsToken=US_AFF_0_206880_212556_0&url=https://je4zs.app.link/069stfNFxAb
