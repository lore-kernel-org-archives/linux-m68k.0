Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D01C54EBC
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 17:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbjAJRA6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Jan 2023 12:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233733AbjAJRAu (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jan 2023 12:00:50 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F346175
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 09:00:50 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id z12so11398882qtv.5
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9Q4xR3/ugGu6VdXBdV2WzDEkLAveyuUMK6Fmtpu5CI=;
        b=UkzIifNg8h3y1wtOjs7I09aasMqbcBL48tTSXl5YQt3BnJkvMjAkTHL0MaFFNWQZYX
         4CsKc6scoQGa9g8hKgdDYE/OO6qFYuQVBvcn9GUWnBdZBNd8rjNl6z/xxe3abak+GTjX
         eMmftq+OUqLyR6il4PedIoKcEZf+xLffUn5lUZmW/KhJI/VLLuZ4BZcdGJoHqfk6auyV
         mW8r1rkfPAHuo8nyJVSY0Cvr6SmuWtCRoXuUFQ/Qt/VsH94/yl33eiRhord2qBXoESCl
         RmAE35pULmRpZUCeq98JEvP13G8vDDLeq0Btymsu8R8a48Uqn+Afi5g5EcViNIPIuP/8
         Z9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9Q4xR3/ugGu6VdXBdV2WzDEkLAveyuUMK6Fmtpu5CI=;
        b=YvhEgHEtYHhQpQviuOGU7CZysVrU7EiSZkmYFVmQYTYKJfSKMdG6vp08rARii19EMB
         +lFFu3cA1CcAD7bvlZfV4zrVvTmZiSsQCZgU3XWB+wDeU+slU+SbST+ygCe/LZis0pg1
         YtxoX1qC7J36xp8pIJeikRReppLHxwSMRG3VMQ5yBOgtzTL8k3/jxhACKpMXtzEg/8As
         n21mlqOpXdL6Y6oVrPS8/+k11q3vTlVrVcoJo0IhQqOYn2kzOFuhLeaYfCxLQNl3gtjt
         9C+DnLliNQWucUcT/gt2XeZGckhN54XdKN1vBpG1Um5pBOS7fPq253IkrwE+G94fbcYn
         0uZQ==
X-Gm-Message-State: AFqh2kr6VPWngUH3Hz1+L3NRH0rZ2LfUi8BNPbjYkEr9lgJOH1FgefD0
        0+zjEYkcFbGEV7T0INPRAlfjtycl1DY=
X-Google-Smtp-Source: AMrXdXt8CtfBukmcZYH63jRBOROM++Az8K2hJxg4auTsehESnLutIDxLl4Uh0EdWoxytFy9KbnJyUQ==
X-Received: by 2002:a05:622a:514:b0:3ab:d187:9e7 with SMTP id l20-20020a05622a051400b003abd18709e7mr36593199qtx.44.1673370049249;
        Tue, 10 Jan 2023 09:00:49 -0800 (PST)
Received: from [10.0.0.30] (c-76-111-137-61.hsd1.de.comcast.net. [76.111.137.61])
        by smtp.gmail.com with ESMTPSA id fu28-20020a05622a5d9c00b003a7f3c4dcdfsm6270740qtb.47.2023.01.10.09.00.47
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Jan 2023 09:00:48 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH v11 2/3] m68k: add kernel seccomp support
From:   Josh Juran <jjuran@gmail.com>
In-Reply-To: <20230110004504.20292-3-schmitzmic@gmail.com>
Date:   Tue, 10 Jan 2023 12:00:10 -0500
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        glaubitz@physik.fu-berlin.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <10FF42FA-120C-4A67-AD2E-188ABE7C4AA3@gmail.com>
References: <20230110004504.20292-1-schmitzmic@gmail.com> <20230110004504.20292-3-schmitzmic@gmail.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jan 9, 2023, at 7:45 PM, Michael Schmitz <schmitzmic@gmail.com> =
wrote:

> Add necessary arch Kconfig options, define TIF_SECCOMP trace
> flag and provide basic seccomp filter support in asm/syscall.h

...

> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>=20
> --
> Changes from v10:
>=20
> - fix merge conflicts

...

The patch below adds, rather than removes, merge conflict markers.  Am I =
missing something?

> diff --git =
a/Documentation/features/seccomp/seccomp-filter/arch-support.txt =
b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
> index dc71bf7b1a7e..0c2ac424094d 100644
> --- a/Documentation/features/seccomp/seccomp-filter/arch-support.txt
> +++ b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
> @@ -13,8 +13,12 @@
>     |        csky: |  ok  |
>     |     hexagon: | TODO |
>     |        ia64: | TODO |
> +<<<<<<< HEAD
>     |   loongarch: |  ok  |
>     |        m68k: | TODO |
> +=3D=3D=3D=3D=3D=3D=3D
> +    |        m68k: |  ok  |
> +>>>>>>> 596095b777b9... m68k: add kernel seccomp support
>     |  microblaze: | TODO |
>     |        mips: |  ok  |
>     |       nios2: | TODO |

Cheers,
Josh

