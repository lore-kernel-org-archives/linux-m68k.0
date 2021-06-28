Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69E8C11F66
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 23:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A29061A1D
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 23:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhF1X54 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 19:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhF1X5z (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 19:57:55 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8907C061574
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 16:55:26 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id c8so15632592pfp.5
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 16:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fOwJ009XWzDHSyQvnVFmk8mchZ3rDOSzJwss4bY6xeo=;
        b=JqtHGIC5Oq2KwWVyS8sxplQsMBoLNy1vbeRcnchIDO16CIgGgKDnb8QR5SGWml875K
         kdtcXYybMetm8nJ5sSXiN1J1xqVjvPzq9tKRdWZ6Cj4HVjxzVrEFRzbjGILE4wa/3RzL
         yKeIjYA2XiqOKsBNjN1gpifREjtnVdKO1H5LHIoCtOdrCxZgtjCq/UV0hlHw5p3Qq7b2
         7nbTU4cvwcFE6B0nYsEuUKp1ux234dTNhsK72wzdoRmIl1fua+bViqdD6I4KPIVNneQA
         xiyTCjNQtbVQCYxQCnOXBrNeEVPHpWmyr4vILwQEAzofzyKI63w3NjWOeifswNPxHX/e
         I5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fOwJ009XWzDHSyQvnVFmk8mchZ3rDOSzJwss4bY6xeo=;
        b=nOGo5FRSE5i2JSjK9775DvUvY5v3lcZ+xPpeMDQRe2ygmqK2I+DEOYXJ/pWgN+MQCZ
         sgxnX4fZlzWHg8o8snm4891XhMMFOnlvaYc+fJySJrhqTr8d8YmlCxsHmXvRiAEbjlbo
         g+KKvO9SJwRkizWeI3SNcmD1JMbmwGL0LaGQUf74RMRekrnZMWy8UD/cHGJ8so7m3ccx
         TF7rtEmT5yc7FZcjdp6P6nTTj9QKOBr1e6s5oeJNPmW+up+wgSIwVmRUUwsrP7SSbGFV
         5oFLY/GKBCB2pUMI+KzH+JRC5327VSXDumHBXmDAVf96LAJTxcD85dJeS1+I4EtqeJkZ
         9lcw==
X-Gm-Message-State: AOAM5326ntGttlz+wh8l5T10ZAGH8w/3ymbdJWFolt4fMgTzgSad7nhF
        H//rqa21+GRFhGh/qAZq281g0jquPaaSnA==
X-Google-Smtp-Source: ABdhPJyMYX6vr7/809Mr2m8HPbJrbFV72r9WzrV1W7cy09YmY0wJjkQexkCwjyGnGlBprA/ensbWFQ==
X-Received: by 2002:a63:2046:: with SMTP id r6mr25209944pgm.359.1624924526450;
        Mon, 28 Jun 2021 16:55:26 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id a20sm5241817pfo.190.2021.06.28.16.55.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jun 2021 16:55:26 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 2ACC6360411; Tue, 29 Jun 2021 11:55:22 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de, schwab@linux-m68k.org
Subject: [PATCH v7 0/2] Add kernel seccomp support for m68k
Date:   Tue, 29 Jun 2021 11:55:18 +1200
Message-Id: <1624924520-17567-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Respin of m68k kernel seccomp support. 

I have added syscall_trace_enter() return code checks for
coldfire and 68000 in patch 1, and syscall_get_error(),
syscall_get_return_value() and syscall_set_arguments() defs
in patch 2 (the latter are not used without adding further
code to support tracehooks or syscall tracepoints though).


Cheers,

	Michael

