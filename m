Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A67CC43334
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Jun 2022 15:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbiFWPfR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Jun 2022 11:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiFWPfQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Jun 2022 11:35:16 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCC52F035
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jun 2022 08:35:15 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q9so28501830wrd.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jun 2022 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=CwUiQjxiKnD5n9/TwKt0ZRYsg9QRmrX5ICreA5WOZAc=;
        b=H8A6esgtoUZx02yX6WNVU0gFEMsthIfTqLdkjsvtv+k8xTYE+oJZKrwcUR4znpAbx9
         ELzWapVxjLyXHxuNw9hbVLSpSjlbMKQ6kkBs+PCf81Tc3RXWO0bQN+nJNBnfLml2HK44
         XoH8FHFAxJqkPKbxlaWLTTJ9oY8+9Od1vwvFzkAorTV94rDbqxsoclWo+qhZP0FLCtUM
         DutwBTDUEHetmLAutSpQgnQ4POpgGxBnNNSx7DYYJVbgkkWelZ7X4NXZvIZXfcIRe+qE
         6SMoOBCwWZXlWXXRHRSPb9E1N5AtcIzWJbivtKHmd2SUZc47r+vT/F7Yz03TIfiXtFz2
         Lnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=CwUiQjxiKnD5n9/TwKt0ZRYsg9QRmrX5ICreA5WOZAc=;
        b=mUMKYutP2DX16tGiTe7PgpffPjwnLHzLGGAVmB2k0qhd90TB3fkatwBRJ3mKJqIBgv
         eq+IC+A3L4Ck0xxo9LSvbBU/fbGBbiVIRjYHGDcOHgVo4ED5k5lNA32cPxbv0emajA7j
         +JxIslmdKiD0iXS7S/bI3h640xaFV+YLUB809o3dEuHUcI2keLNHFFQMkZ7rgEyXRkXQ
         4Hwk8Iemzd6Ss7aKMSi0DyALKMZqgXg9bYXEQYieofKJ6daVDSr5PJ+9wCmfZgoWngCV
         hwTP6V6BcotACIN9Df6Ot3OiPEQ0uOa8BZDsUH1h+tV1oJ7+gbN+yeaps98AdMlZQEnw
         PrGA==
X-Gm-Message-State: AJIora8JdM/HDvZqusJt/IeMEA8iMBfjNQkWq05ZZ/qyEP3oKLlg/kJ4
        fp9kZ6wDrXuYv/3eifoCS0FD3XbR0sQ=
X-Google-Smtp-Source: AGRyM1uSXAI3ao/0rsoE+uw9sv5nD8wYjZH6QkNhtM2TigZVr7GweXwZg6lpVqokS392szYNubu7+w==
X-Received: by 2002:a5d:4243:0:b0:21b:8483:31d with SMTP id s3-20020a5d4243000000b0021b8483031dmr8893211wrr.691.1655998513834;
        Thu, 23 Jun 2022 08:35:13 -0700 (PDT)
Received: from DESKTOP-DLIJ48C ([39.42.130.216])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d452d000000b0021a3d94c7bdsm20136993wra.28.2022.06.23.08.35.12
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 23 Jun 2022 08:35:13 -0700 (PDT)
Message-ID: <62b48831.1c69fb81.166b1.6c85@mx.google.com>
Date:   Thu, 23 Jun 2022 08:35:13 -0700 (PDT)
X-Google-Original-Date: 23 Jun 2022 11:35:15 -0400
MIME-Version: 1.0
From:   scott.crosslandestimation@gmail.com
To:     linux-m68k@lists.linux-m68k.org
Subject: Quote To Bid
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AScott March=0D=0ACrossland Estimating, INC=20

