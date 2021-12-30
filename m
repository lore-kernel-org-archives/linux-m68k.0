Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58452C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 30 Dec 2021 03:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbhL3DFC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 29 Dec 2021 22:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235096AbhL3DFC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 29 Dec 2021 22:05:02 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F00C06173E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Dec 2021 19:05:02 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so21938889pjp.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Dec 2021 19:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:date:subject:from:to:cc:message-id:thread-topic
         :mime-version:content-transfer-encoding;
        bh=HCfAlaMSnvj/DFkWkfTZyPmms6cxrAZFM9yr8MI4h0g=;
        b=orU3//Aqyh3NX4ouVn1NMsWTBEQmnZZVvXbgPVju2+uAZDOEb51avmwXBF8rN1RaE1
         BwtO99nYcKpvIHZiTTIQlVdLFiLmgQvCVXx1fb5Fv/JExyXsquCQ80Rwvk3I8GSOsmnE
         b4SP2Nv01TFo6e1UnONNcJXqyFD0dYcLIqKvTpfSSrRAFy6RAIdZbu2L2/Cvl4xA/nzG
         Uly6iuwGlqzGD52y+xuuRNqE838H0nSyUUaj2dJANEcfLSs7REvOYjdMYbYuJexLAUCg
         WRwVR8W4iZQzjnhvb9ltWAnpPuXO7Xc9skNFz24pVI97BDr0jIZkFmKVQMcNnP8/LjTo
         bBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:date:subject:from:to:cc:message-id
         :thread-topic:mime-version:content-transfer-encoding;
        bh=HCfAlaMSnvj/DFkWkfTZyPmms6cxrAZFM9yr8MI4h0g=;
        b=stAmizAvA7oFUKHD5/sPACK2sXJaFwAjL2vCLZSYx/06TlpS5SoupJEuZLpGvOqAPE
         3PLL3ZBbZ4peMZsTXtY5yiWqPy5XHgZd/IGpT5PrcyUlvI8eV9/m1wA4GDkY2/aI2W5m
         ptYNlOLID7hqKm4/gs+prmQyVHmR25GHKZzcx55jUnkxA3YlSz7Cs/Ooa9p7ev5k1MLl
         rq9/5HU1zDO4WD7X8bHpwu10ITfVwKkD67bWtVhiGoniLwUxa1i4xjPJrwj59QQk+Per
         W1bq7ruFEKfCXQkwTaaQxQs3oAqXCuQqhFoUXXWsnXQx40twIYpH+KCdIqPahhgRZS8o
         vnVg==
X-Gm-Message-State: AOAM533luZ3gSPHG3d9E+o4axe/cAgFMnTEz+JUFRy9LXLAw3phM0daV
        DxzCi/o4sz86C7K2CLXQn9c=
X-Google-Smtp-Source: ABdhPJzxJDtWcvuTpn1CK+S66A9+rQU5T//Z8yghimRfZ2yj4faYVPbAohuKVLNZ3g6JH1wWzLMMVA==
X-Received: by 2002:a17:90b:3e8c:: with SMTP id rj12mr28208190pjb.184.1640833501548;
        Wed, 29 Dec 2021 19:05:01 -0800 (PST)
Received: from [30.135.82.251] ([23.98.35.75])
        by smtp.gmail.com with ESMTPSA id l186sm20827387pga.24.2021.12.29.19.05.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Dec 2021 19:05:01 -0800 (PST)
User-Agent: Microsoft-MacOutlook/16.56.21121100
Date:   Thu, 30 Dec 2021 11:04:58 +0800
Subject: [Resource Leak] Missing closing files
From:   Ryan Cai <ycaibb@gmail.com>
To:     <greg@kroah.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>
Message-ID: <5C277DBF-B1EF-4193-9983-63105E5BC053@gmail.com>
Thread-Topic: [Resource Leak] Missing closing files
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Dear Kernel maintainers,
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In=C2=A0linux/drivers/zorro/gen-devlist.c, the file opened=
 at Line 39 may not closed when going to Line 65.=C2=A0
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I think, return 1 at Line 65 should be goto error. Shoul=
d it be a bug? I can send a patch.
=C2=A0
Location:=C2=A0https://github.com/torvalds/linux/blob/5bfc75d92efd494db37f5c4c1=
73d3639d4772966/drivers/zorro/gen-devlist.c#L39-L65
=C2=A0
=C2=A0
=C2=A0
Best,
Ryan
=C2=A0



