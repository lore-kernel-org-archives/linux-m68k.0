Return-Path: <SRS0=881o=3C=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43008C33CAB
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jan 2020 05:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20FED21556
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jan 2020 05:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725263AbgAMFIV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Jan 2020 00:08:21 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:26898 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgAMFIV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Jan 2020 00:08:21 -0500
IronPort-SDR: PrMG4UJpRdJeJVzxeQ7k2teozT8vu8MDmZ/giVg4kdPqMQSSHRg9kmzwToUIWE+WyIuCyAk/cX
 /UJA/1ipix3A==
IronPort-PHdr: =?us-ascii?q?9a23=3AdNS8oxMnW5ox1XhUu6El6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0I/z+rarrMEGX3/hxlliBBdydt6sfzbCI4uu/CCQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagb75+Ngu6oATVu8UZg4ZvLrs6xw?=
 =?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
 =?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
 =?us-ascii?q?mu87tnRRn1gysBMDI37X3YhdZ1jKNbuR6suRt/w5TMYIGSLvpxZL/dcs0DSW?=
 =?us-ascii?q?VfWMZdTjBMAp+gb4QVE+UBPfhXr4zjqFsIsRuyHBejBOX2xjFPgX/227M10u?=
 =?us-ascii?q?Q4HQ7Y2gwrAtYCvXrIoNnpMasfV/2+wqvVwjXZd/5Y1zfz6JLWfB4ivP+DUq?=
 =?us-ascii?q?5/f8XKxEkzFQ7KkkmcpZD5Mz+L0OkGrmiV7/BnVeKqk2MpsR9+oiSxycc2l4?=
 =?us-ascii?q?LGhoUVylbL9S5kx4s1PcO3SFJlbt6+HppQsCeaN4RtT8MiWGFnozo1xqcatp?=
 =?us-ascii?q?68eSgG0pQnxx3GZvGBboOG4QrjWf6PLTtlhn9pYq+zihiu/US61OHxWdO43V?=
 =?us-ascii?q?hKoydDj9LCrGoC1wbJ5ciCUvZ9+0Ch1iuR2A3L8eFEJFw0lbLcK5483r48jp?=
 =?us-ascii?q?oTvlrHHi/xgEj2ibWZdkQg+uiy9evnZqnqq5CGO49qjQHxL74hmsK4AeQ+LA?=
 =?us-ascii?q?cCRXaU+f+k2L3i+032XqlKg+UonqXEsp3WP9kXq6ClDwNPzIou5AyzAjmm3d?=
 =?us-ascii?q?gAmHkINlNFeBaJj4jzPFHOJej1De+hjFSwjjhr3f7HPrrnApXCNXXDkKzhcq?=
 =?us-ascii?q?1h5EJG1AUzytVf64hUCrECOP7zQFP+tMTEDh8lNAy52+LnCNR71oMDVmODG6?=
 =?us-ascii?q?qZPaLRvF+L/e8vJ+iMZJQJuDbmMfQl4//ujXkkmV4SZKWp2JoaZXO7Hvh8JE?=
 =?us-ascii?q?WZe3Xs0Z89FjIOvwwjXKnv1g2BeTpSfGqpGaY94CwrTYf4XYSFQZqi04aMxC?=
 =?us-ascii?q?OqIpoDXm1aB0rELnDueM3QQ/oQZTiNJclukj8ETrKqY4Ak3BCq8gT9zuw0AP?=
 =?us-ascii?q?DT/3gguI7uzpBK4Ovc3UUq+CB5Fdua1W6lT3p+lSUDQDpw3KMp8h818UuKza?=
 =?us-ascii?q?Ut2q8QLtdU/f4cCV9iOA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETKgDQ+htemCMYgtkUBTMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhggTDIFbDQEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4M?=
 =?us-ascii?q?EgksBATOFJJdYAY0EDQ0ChR2COQQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V4EMDXpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2ETKgDQ+htemCMYgtkUBTMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbD?=
 =?us-ascii?q?QEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNC?=
 =?us-ascii?q?wYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOFJJdYA?=
 =?us-ascii?q?Y0EDQ0ChR2COQQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V4EMD?=
 =?us-ascii?q?XpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,427,1571695200"; 
   d="scan'208";a="323790666"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 13 Jan 2020 06:08:19 +0100
Received: (qmail 24399 invoked from network); 12 Jan 2020 05:00:21 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-m68k@lists.linux-m68k.org>; 12 Jan 2020 05:00:21 -0000
Date:   Sun, 12 Jan 2020 06:00:19 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-m68k@lists.linux-m68k.org
Message-ID: <29644297.460788.1578805221062.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

