Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55ABBC64ED6
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 15:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbjBUPAK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 10:00:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbjBUPAH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Feb 2023 10:00:07 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B782B609
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 06:59:56 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id j2so4571816wrh.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8YvNBhOfpRjHTDjgku2It2uP7e9HWXGEEJXRoHvZp2s=;
        b=gGxCZqjuKG46yZ2wvQvExCpyNdjQA28e6iSi9wNbAVD7ZdgJfz30wfdXVdyyuKR/B5
         yOe27423ulTOO1aBe3ObFquJuc+rlzso8eS8z1ppgO0NfDe36B5sE856wQC0qoAgd+jG
         SiDMsZ+R5gKegW1qtJlselhM0ZKeEWB4unYnCr6alqjOlLitjzXeeRT2CbhHNPjkhsVT
         wfhGtB1bVK/7hc0e8ZZQ2D1yJ5oaAOt6DYt4pbGf6xsiCGHJye/sJ85EQwAeIG77AxSA
         +FJIO/KH5Z1eDJDR1bm4pdyuGpWZassNHz37CoAi1hY4H8kdPlnnMmBMjUxWO4H3ue0R
         Tfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YvNBhOfpRjHTDjgku2It2uP7e9HWXGEEJXRoHvZp2s=;
        b=DYSOHMyZyj4pmILgH6a9IgzPFejv+sx9gN4RRdVkwqjTb0PvtASww0exu5VdpRK4f3
         /Bi5Xg7lykPilGYbmkfKJqork2XO11tXZOmOFkAvwi66xzrBiBU1w4O8NG1E8ui1YXwM
         dWn1mcr0Qkv+2TzLHqqaGAnXdgH0fThBxrDyU0HLEptgIpetzGUIAfe1X7DdE2a7EDm1
         o3aKHVS5jLQErxGpHPv6HB8dRbfYRhKcgv8KHppWl8kaGP26Q9Tgt9vP122oAhtbDcAp
         G9dC0v6CO2vmTItF7MzM9/Ld/yExlMIr7jSFV2OzLRll7MTnX25RjUDQYM8fHZzuDFvv
         vJvA==
X-Gm-Message-State: AO0yUKWvPthUXWkR9Z6DDBgInR5TkzYsV+jR7cKYjuV8Q4sxexyUrU5H
        R1Qu+fPJY0aykwTnOFznrprnRn75d6Q=
X-Google-Smtp-Source: AK7set/Nxfr8p937shvwfLHTFssFihL8KHYW5ZWL5HsTH48qVOrq3jGG4nMG3W9rOC6acxK/SoLK4w==
X-Received: by 2002:adf:e543:0:b0:236:695b:82d4 with SMTP id z3-20020adfe543000000b00236695b82d4mr4947234wrm.30.1676991594650;
        Tue, 21 Feb 2023 06:59:54 -0800 (PST)
Received: from DESKTOP-L1U6HLH ([39.42.138.70])
        by smtp.gmail.com with ESMTPSA id p8-20020a1c7408000000b003b47b80cec3sm4045193wmc.42.2023.02.21.06.59.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 21 Feb 2023 06:59:54 -0800 (PST)
Message-ID: <63f4dc6a.1c0a0220.56de7.c6f2@mx.google.com>
Date:   Tue, 21 Feb 2023 06:59:54 -0800 (PST)
X-Google-Original-Date: 21 Feb 2023 09:59:55 -0500
MIME-Version: 1.0
From:   shelbyhildreth897@gmail.com
To:     linux-m68k@lists.linux-m68k.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,=0D=0A=0D=0AIn case you really want take-offs for a developmen=
t project, we ought to be your consultancy of decision. Reach out=
 to us assuming that you have any undertakings for departure whic=
h could utilize our administrations.=0D=0A=0D=0ASend over the pla=
ns and notice the exact extent of work you need us to assess.=0D=0A=
We will hit you up with a statement on our administration charges=
 and turnaround time.=0D=0AIn case you endorse that individual st=
atement then we will continue further with the gauge.=0D=0A=0D=0A=
For a superior comprehension of our work, go ahead and ask us que=
stions .=0D=0A=0D=0AKind Regards=0D=0AShelby Hildreth		=0D=0ADrea=
mland Estimation, LLC

