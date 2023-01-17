Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F00C3DA78
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Jan 2023 13:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjAQNtT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Jan 2023 08:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbjAQNso (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 17 Jan 2023 08:48:44 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AD63B3C3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Jan 2023 05:48:38 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id g10so22287548wmo.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Jan 2023 05:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N5tYXkNIS3jTV4edAWNOmiWisVq7nS7J1ZgQE1Xv1vQ=;
        b=RAHABvA7EevCOnUlaoudoTfJF0OSTNGE3O24gYcsoKT6+n7Zuo13kYahjOLRTdwfaA
         UVqUlufw1NhXNaIUWuUM8WmywxYpoUyMkWUx5xpiVBrBWyF2rnwUCQye04UeTbNxrOHk
         B6WYYna7yd9fTt6Ky4xsT5keBaSn6MKr/f49FCuEiJXM+8SRfH/K46t6AYS+kBzsg4Zp
         7BrINPKwquSfL4kBfFuLImHhtnRe5NJZVh2Cq0NLaWCbEoaM8O7fFwXYQN1Q7OXei+Cm
         EXXO2TOtwcdLeLYFYrJKnr9GETIsU8pFl7GN1tu9nOfdTqrL9V4m2czK8A6XhPEPQI0T
         KE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5tYXkNIS3jTV4edAWNOmiWisVq7nS7J1ZgQE1Xv1vQ=;
        b=DgnDHaEPVchUFAmajUG4/0XfdgPGDGiWUpxvRvW0f9NW//uLKOOYT0mysM/q+uRaKM
         KnVH8/XJcrqIJgfz7DjwJLiZbNhs8/aKjua4oJRSLUokiZgHgrhdJMj07L1GEiUIciy5
         FbhvyJehzZ90RbqWJcMn3MJc5lqouVPaA0W3a+Yilb+W3Sif0XAhoShnGR+smf0jzubg
         +Fxd4MJ5cCs0DyGdLp5/ZsdT1xCcGtscLEl0YpJVJ61PgdmJKeKhiieKfphYJ5lGNFLm
         VmetYZa3snVkV84nNWfbBLXBtHIJgCxosPJAcwLiMNdyoBFuOF/6PvncZ7CI1gJybPLx
         j1FA==
X-Gm-Message-State: AFqh2kqAOdbcw4E31rUQWle55+PZ8mgjBoS9pOToscD2oMmJ2vZKoJIY
        J6c4GTP+cocN1LKueZtbKJQNKYQ4xqM=
X-Google-Smtp-Source: AMrXdXt3lqFjpG9XH1IK2rPlSE1814Ml0Rc6ozLzhkqdaV87c34xQQH04lA+Tai9IZuQ1smE6HcL5A==
X-Received: by 2002:a1c:7919:0:b0:3d3:58d1:2588 with SMTP id l25-20020a1c7919000000b003d358d12588mr11734296wme.41.1673963316507;
        Tue, 17 Jan 2023 05:48:36 -0800 (PST)
Received: from DESKTOP-53HLT22 ([39.42.178.198])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c458a00b003d35acb0fd7sm44898287wmo.34.2023.01.17.05.48.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 17 Jan 2023 05:48:36 -0800 (PST)
Message-ID: <63c6a734.050a0220.e6a77.8fb4@mx.google.com>
Date:   Tue, 17 Jan 2023 05:48:36 -0800 (PST)
X-Google-Original-Date: 17 Jan 2023 08:50:11 -0500
MIME-Version: 1.0
From:   erickshelton4398@gmail.com
To:     linux-m68k@lists.linux-m68k.org
Subject: Any Drawings for Estimate?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

=0D=0AHi,=0D=0A=0D=0ADo you have any estimating projects for us=0D=0A=
=0D=0AIf you are holding a project, please send over the plans in=
 PDF format for getting a firm quote on your project.=0D=0A=0D=0A=
Let me know if you have any questions or if you would like to see=
 some samples.=0D=0A=0D=0AWe will be happy to answer any question=
s you have. Thank you=0D=0A=0D=0ARegards,=0D=0AErick Shelton=0D=0A=
Crossland Estimation, INC

