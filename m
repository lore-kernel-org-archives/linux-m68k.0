Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4817CA0FE2
	for <linux-m68k@archiver.kernel.org>; Tue,  5 Sep 2023 16:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343716AbjIEQVx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353834AbjIEIUo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 5 Sep 2023 04:20:44 -0400
X-Greylist: delayed 86463 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 01:20:41 PDT
Received: from mail.equinoxrise.pl (mail.equinoxrise.pl [217.61.112.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885B6CC7
        for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Sep 2023 01:20:41 -0700 (PDT)
Received: by mail.equinoxrise.pl (Postfix, from userid 1002)
        id 57F4683496; Mon,  4 Sep 2023 09:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=equinoxrise.pl;
        s=mail; t=1693813324;
        bh=v6OgBfK5dN7P5dQ0wCu59rOfZaiqziJeLNblJ8dOcGI=;
        h=Date:From:To:Subject:From;
        b=jbrdMN2Aq3LSZL6f1VCVHRs7buGsPNst7PDL7t15AxP/0shoJ3fzBQq5uU/DflsMa
         MMSpIS91TH4VsjGJ7NE814EBw2Ra0Gi2R9PrXaO4ZEzW0v3G/4pW0ZwQrGVCEeSZuX
         4XtRLtuTwAg8pVUFBjcS5xn4Ac6JGhZ3Tj4AW/oaT2m2D6gW+0VHTQN8vjfisobpbn
         De8veAhncoSUmWSy0wS6r3YZksDru2sTP3DH2oLaHka00j8KMC7CEY2RO6OlmCJK2r
         XzWyLqg0zzUykzeHJUq8f7Cdq6MLxTnjq4Z+1zcy//80r5skOkKewLXtQHFgsOH3kC
         +yGNPx/ibZ7PA==
Received: by mail.equinoxrise.pl for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Sep 2023 07:40:34 GMT
Message-ID: <20230904084500-0.1.7.qyc.0.5n7de20bp6@equinoxrise.pl>
Date:   Mon,  4 Sep 2023 07:40:34 GMT
From:   "Mateusz Talaga" <mateusz.talaga@equinoxrise.pl>
To:     <linux-m68k@lists.linux-m68k.org>
Subject: Prezentacja
X-Mailer: mail.equinoxrise.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Dzie=C5=84 dobry!

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re umo=C5=
=BCliwia monitoring ka=C5=BCdego auta w czasie rzeczywistym w tym jego po=
zycj=C4=99, zu=C5=BCycie paliwa i przebieg?

Dodatkowo nasze narz=C4=99dzie minimalizuje koszty utrzymania samochod=C3=
=B3w, skraca czas przejazd=C3=B3w, a tak=C5=BCe tworzenie planu tras czy =
dostaw.

Z naszej wiedzy i do=C5=9Bwiadczenia korzysta ju=C5=BC ponad 49 tys. Klie=
nt=C3=B3w. Monitorujemy 809 000 pojazd=C3=B3w na ca=C5=82ym =C5=9Bwiecie,=
 co jest nasz=C4=85 najlepsz=C4=85 wizyt=C3=B3wk=C4=85.

Bardzo prosz=C4=99 o e-maila zwrotnego, je=C5=9Bli mogliby=C5=9Bmy wsp=C3=
=B3lnie om=C3=B3wi=C4=87 potencja=C5=82 wykorzystania takiego rozwi=C4=85=
zania w Pa=C5=84stwa firmie.


Pozdrawiam
Mateusz Talaga
