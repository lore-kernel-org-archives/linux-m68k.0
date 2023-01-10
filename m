Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7202BC54EBD
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 00:45:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjAJApU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 19:45:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbjAJApS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2023 19:45:18 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADCDE035
        for <linux-m68k@vger.kernel.org>; Mon,  9 Jan 2023 16:45:17 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id h192so7102395pgc.7
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2023 16:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2tqsKc+ARvXsK3H7Iu4Re8mLtCh5+kfF33kzQBEezs=;
        b=nQFrmW9q8U5CgftXoM85kjNbPdiNrV5Rp9uYAN/zHBUuj2rg3JdPEhzWEvBfKH64n+
         ArtT3R7ZAh8/5Q5O1s1s3tVPRH+u9bJDjsn8nMc8EXdtxdD9cHdCSBBx+9vM2majh32l
         JOuZxRCPNDprQkNY1KpqxeIu7Gyn8wrR488LB0lukMM0xiGpye+yU+taYbyWEjC5tTbZ
         vPshqDaxIHTy6bYA1AfbuAJpEzGKZuo711n4kx2nx+EILSfAd8zeh0TtBgyPKTJfigXY
         3sTBx3DfD1oygPF95t/VJeD8Bw4e/IRch+jfm1sgpfSk68ty/Mo9I/r9dVawzb21vDcC
         9OyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2tqsKc+ARvXsK3H7Iu4Re8mLtCh5+kfF33kzQBEezs=;
        b=TAuzdg/1GJXMQ8P6CA7sCpB8qBTrsnmn857bvWmOzKHFr2n0wbP8uANs0b7N2nMnLy
         XH2vAZmyz6x6JWYSxfkRslsWqoVDOE6NZTbdL6YK0FpbOfr96eoBwrOiaSL1mrbSrIQf
         xTnZOAPGdjXQdbH/CCMeTcYklJJ+XZhPnnxUQfad6fAvTr1dQDeAOwJXD6o/VIeP0pNn
         vatp7X19M/Z9SmfU30KbToZW6bK+vPMU8UnVIUtYCj2idGkMWhpg7mhVau/DGTmy6614
         oUnARHAF6kZirGRIjtwPZV3yY4JIUSaFgDVQ019dPFGjF4aytNPAIF2yD4w3c878GSwR
         w8yg==
X-Gm-Message-State: AFqh2kql/Zl3oR3RDAJ25m7XCM49/lLa3G9jCnpuvVjNUG1mQW/QKNyX
        3OStNqxuQkJ0mCuBgfgfSGq+3Iz1QxY=
X-Google-Smtp-Source: AMrXdXvsx2EdvU6aVyOmNIrel+n/tAvsh0RGfYgstnNROAsFn6gz4DzYXJhI/NlIC/RxXG6q6yoOow==
X-Received: by 2002:aa7:9052:0:b0:58a:898b:e71f with SMTP id n18-20020aa79052000000b0058a898be71fmr509901pfo.26.1673311517367;
        Mon, 09 Jan 2023 16:45:17 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id v67-20020a622f46000000b00581ad007a9fsm6618931pfv.153.2023.01.09.16.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 16:45:16 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id A7E45360205; Tue, 10 Jan 2023 13:45:12 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de
Subject: [PATCH v11 0/3] Add kernel seccomp support for m68k
Date:   Tue, 10 Jan 2023 13:45:01 +1300
Message-Id: <20230110004504.20292-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Patch 1 from v10 of this series is now merged, so patch
numbering shifts by one.
Fixed a merge conflict in patch 2 (caused by change from 
tracehook to ptrace API. 
Added m68k seccomp self test support as patch 3.

Tested on ARAnyM, 63 out of 89 seccomp_bpf tests now pass
(33 with the old version).

Cheers,

   Michael


