From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k: merge the MMU and non-MMU
 versions of the arch dma code
Date: Sun, 20 May 2012 11:01:27 +0200
Message-ID: <CAMuHMdXywsYD4-or9UUbM3MPjY=4czm6LUhhY4WDyiruMzmBgQ@mail.gmail.com>
References: <1336114247-22764-1-git-send-email-gerg@snapgear.com>
 <1336114247-22764-3-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1336114247-22764-3-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

T24gRnJpLCBNYXkgNCwgMjAxMiBhdCA4OjUwIEFNLCAgPGdlcmdAc25hcGdlYXIuY29tPiB3cm90
ZToKPiBGcm9tOiBHcmVnIFVuZ2VyZXIgPGdlcmdAdWNsaW51eC5vcmc+Cj4KPiBUaGUgbWFqb3Jp
dHkgb2YgdGhlIG02OGsgYXJjaGl0ZWN0dXJlIGRtYSBjb2RlIGlzIHRoZSBzYW1lLCBzbyBtZXJn
ZSB0aGUKPiBjdXJyZW50IHNlcGFyYXRlZCBmaWxlcyBkbWFfbm8uYyBhbmQgZG1hX21tLmMgYmFj
ayBpbnRvIGEgc2luZ2xlIGRtYS5jCj4KPiBUaGUgbWFpbiBhbGxvYyBhbmQgZnJlZSByb3V0aW5l
cyBhcmUgYSBsaXR0bGUgZGlmZmVyZW50LCBzbyB3ZSBrZWVwIGEKPiBzaW5nbGUgI2lmZGVmIGJh
c2VkIG9uIENPTkZJR19NTVUgZm9yIHRoZW0uIEFsbCB0aGUgb3RoZXIgc3VwcG9ydCBmdW5jdGlv
bnMKPiBhcmUgbm93IGlkZW50aWNhbC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgVW5nZXJlciA8
Z2VyZ0B1Y2xpbnV4Lm9yZz4KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgwqAgwqDCoCAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwp1Q2xpbnV4LWRldiBtYWlsaW5nIGxp
c3QKdUNsaW51eC1kZXZAdWNsaW51eC5vcmcKaHR0cDovL21haWxtYW4udWNsaW51eC5vcmcvbWFp
bG1hbi9saXN0aW5mby91Y2xpbnV4LWRldgpUaGlzIG1lc3NhZ2Ugd2FzIHJlc2VudCBieSB1Y2xp
bnV4LWRldkB1Y2xpbnV4Lm9yZwpUbyB1bnN1YnNjcmliZSBzZWU6Cmh0dHA6Ly9tYWlsbWFuLnVj
bGludXgub3JnL21haWxtYW4vb3B0aW9ucy91Y2xpbnV4LWRldg==
